import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cnfaceattendance/data/local/db/userdb.dart';
import 'package:cnfaceattendance/model/isarmodel/face_id_model.dart';
import 'package:cnfaceattendance/repository/faceidrepository.dart';
import 'package:cnfaceattendance/utils/alertbox.dart';
import 'package:cnfaceattendance/utils/camera_service.dart';
import 'package:cnfaceattendance/utils/ml_service.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as imglib;

class ScanPersonController extends GetxController {
  MLService mlService = MLService();
  final repository = FaceIdRepository();

  final userDb = UserDb();

  int userId = 0;
  String userName = "";

  var status = 0.obs;
  var person = "".obs;

  @override
  Future<void> onInit() async {
    userId = Get.arguments["userId"] ?? 0;
    userName = Get.arguments["username"] ?? "";
    await getImageFromCamera();

    super.onInit();
  }

  Future<void> getImageFromCamera() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(
          source: ImageSource.camera,
          preferredCameraDevice: CameraDevice.front);

      if (photo == null) {
        Get.back();
        return;
      }

      customLoader();

      InputImage image;
      if (Platform.isAndroid) {
        image = InputImage.fromFilePath(photo.path);
      } else {
        File rotatedImage =
            await FlutterExifRotation.rotateImage(path: photo.path);
        image = InputImage.fromFilePath(rotatedImage.path);
      }

      final faceDetector = FaceDetector(
          options: FaceDetectorOptions(
        enableContours: false,
        enableClassification: true,
        enableLandmarks: true,
        enableTracking: true,
        minFaceSize: 0.1,
        performanceMode: FaceDetectorMode.accurate,
      ));
      List<Face> faces = await faceDetector.processImage(image);

      Get.back();

      if (faces.isEmpty) {
        status.value = 2;
        showAlert("No Face Found");
        return;
      }
      List<Map<String, int>> faceMaps = [];
      for (Face face in faces) {
        int x = face.boundingBox.left.toInt();
        int y = face.boundingBox.top.toInt();
        int w = face.boundingBox.width.toInt();
        int h = face.boundingBox.height.toInt();
        Map<String, int> thisMap = {'x': x, 'y': y, 'w': w, 'h': h};
        faceMaps.add(thisMap);
      }

      imglib.Image? originalImage =
          imglib.decodeImage(File(photo.path).readAsBytesSync());

      imglib.Image faceCrop = imglib.copyCrop(originalImage!, faceMaps[0]['x']!,
          faceMaps[0]['y']!, faceMaps[0]['w']!, faceMaps[0]['h']!);

      imglib.Image img = imglib.copyResizeCropSquare(faceCrop, 112);

      Float32List imageAsList = imageToByteListFloat32(img);

      List input = imageAsList;

      input = input.reshape([1, 112, 112, 3]);
      List output = List.generate(1, (index) => List.filled(192, 0));
      await mlService.initialize();
      mlService.interpreter?.run(input, output);
      output = output.reshape([192]);

      final predictedData = List.from(output);

      if (predictedData.isNotEmpty) {
        final predictedValue = jsonEncode(predictedData);

        //api code and save face id in db
        try {
          customLoader();
          await repository.faceIdApi(userId, predictedValue);
           await repository.addFaceId(FaceIdModel(userId, predictedValue));
        } catch (e) {
          showAlert(e.toString());
        }

        Get.back();
        person.value = "Face has been saved";
        status.value = 1;

        showLottieDialog("Face Saved", "Face has linked to the employee",
            AlertType.success, "assets/raw/confirm.json");
      } else {
        person.value = "Face was not able to saved";
        status.value = 2;
        showLottieDialog(
            "Face not saved",
            "Something went wrong. Face was not saved",
            AlertType.error,
            "assets/raw/error.json");
      }
    } catch (e) {
      status.value = 2;
      person.value = "Something went wrong. Please scan face again";
      showLottieDialog(
          "Face not saved",
          "Something went wrong. Please scan face again",
          AlertType.error,
          "assets/raw/error.json");
    }
  }
}
