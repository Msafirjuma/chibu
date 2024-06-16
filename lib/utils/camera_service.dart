import 'package:image/image.dart' as imglib;

import 'dart:io';
import 'dart:typed_data';

import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

Future<List<Face>> detectFacesFromCameraImage(InputImage image) async {
  final faceDetector = FaceDetector(
      options: FaceDetectorOptions(
          performanceMode: FaceDetectorMode.fast, enableLandmarks: true));
  return await faceDetector.processImage(image);
}

List<Map<String, int>> cropFaceFromImage(List<Face> faces){
  List<Map<String, int>> faceMaps = [];
  for (Face face in faces) {
    int x = face.boundingBox.left.toInt();
    int y = face.boundingBox.top.toInt();
    int w = face.boundingBox.width.toInt();
    int h = face.boundingBox.height.toInt();
    Map<String, int> thisMap = {'x': x, 'y': y, 'w': w, 'h': h};
    faceMaps.add(thisMap);
  }

  return faceMaps;
}

Float32List processInputDataFromImage(List<Map<String, int>> faceMaps, XFile photo){
  imglib.Image? originalImage =
  imglib.decodeImage(File(photo.path).readAsBytesSync());

  imglib.Image faceCrop = imglib.copyCrop(originalImage!, faceMaps[0]['x']!,
      faceMaps[0]['y']!, faceMaps[0]['w']!, faceMaps[0]['h']!);

  imglib.Image img = imglib.copyResizeCropSquare(faceCrop, 112);

  Float32List imageAsList = imageToByteListFloat32(img);

  return imageAsList;
}

Float32List imageToByteListFloat32(imglib.Image image) {
  var convertedBytes = Float32List(1 * 112 * 112 * 3);
  var buffer = Float32List.view(convertedBytes.buffer);
  int pixelIndex = 0;

  for (var i = 0; i < 112; i++) {
    for (var j = 0; j < 112; j++) {
      var pixel = image.getPixel(j, i);
      buffer[pixelIndex++] = (imglib.getRed(pixel) - 128) / 128;
      buffer[pixelIndex++] = (imglib.getGreen(pixel) - 128) / 128;
      buffer[pixelIndex++] = (imglib.getBlue(pixel) - 128) / 128;
    }
  }
  return convertedBytes.buffer.asFloat32List();
}