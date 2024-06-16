import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cnfaceattendance/repository/attendancerepository.dart';
import 'package:cnfaceattendance/utils/alertbox.dart';
import 'package:cnfaceattendance/utils/camera_service.dart';
import 'package:cnfaceattendance/utils/ml_service.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:selfie_liveness/selfie_liveness.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as imglib;
import 'package:tflite_flutter/tflite_flutter.dart';

class AttendanceController extends GetxController {
  MLService mlService = MLService();
  final repository = AttendanceRepository();

  var status = 0.obs;
  var person = "".obs;

  var mode = 0;

  @override
  Future<void> onInit() async {
    mode = Get.arguments["mode"];

    await getImageFromCamera();
    super.onInit();
  }

  Future<void> getImageFromCamera() async {
    try {
      final value = await SelfieLiveness.detectLiveness(
        poweredBy: "",
        assetLogo: "",
        compressQualityandroid: 20,
        compressQualityiOS: 20,
      );

      if (value.isEmpty) {
        Get.back();
        return;
      }

      InputImage image;
      if (Platform.isAndroid) {
        image = InputImage.fromFilePath(value);
      } else {
        File rotatedImage = await FlutterExifRotation.rotateImage(path: value);
        image = InputImage.fromFilePath(rotatedImage.path);
      }
      customLoader();
      final faceDetector = FaceDetector(
          options: FaceDetectorOptions(
        enableContours: false,
        enableClassification: true,
        enableLandmarks: true,
        enableTracking: true,
        minFaceSize: 0.1,
        performanceMode: FaceDetectorMode.fast,
      ));
      List<Face> faces = await faceDetector.processImage(image);
      Get.back();
      if (faces.isEmpty) {
        status.value = 2;
        showLottieDialog("Unknown User", "Face not found", AlertType.error,
            "assets/raw/error.json");
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
          imglib.decodeImage(File(value).readAsBytesSync());

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

        _searchResult(predictedData, File(value));
      } else {
        showLottieDialog("Unknown User", "User not found", AlertType.error,
            "assets/raw/error.json");
      }
    } catch (e) {
      status.value = 2;
      person.value = "Something went wrong. Please scan face again";
    }
  }

  void _searchResult(List predictedData, File imageFile) async {
    double currDist = 0.0;

    //find the value for local database of isar and compare all the data
    //to find the least scoring value to match the user
    //final value = await isarController.isar.faceIds.where().findAll();
    var faceIds = await repository.getAllFaceIds();

    var currentDistance = 1.0;
    var userId = 0;

    for (var model in faceIds) {
      currDist = euclideanDistance(jsonDecode(model.faceId), predictedData);

      if (currDist < 0.7) {
        if (currDist < currentDistance) {
          currentDistance = currDist;
          userId = model.userId;
        }
      }
    }
    if (currentDistance < .77) {
      person.value = " User found";
      status.value = 1;
      //call api of attendance to make attendance
      var user = await repository.getUserById(userId);
      try {
        var attendancestatus = 'checkIn';
        switch (mode) {
          case 0:
            {
              attendancestatus = "checkIn";
            }
            break;
          case 1:
            {
              attendancestatus = "checkOut";
            }
            break;
          case 2:
            {
              attendancestatus = "lunchIn";
            }
            break;
          case 3:
            {
              attendancestatus = "lunchOut";
            }
            break;
        }
        customLoader();
        var response = await repository.saveEmployeeAttendance(
            userId, attendancestatus, '', imageFile.path);

        Get.back();
        showLottieDialog(response.message, "Hello  ${user!.name}",
            AlertType.success, "assets/raw/confirm.json");
      } catch (e) {
        Get.back();
        showLottieDialog(e.toString(), "Hello  ${user!.name}", AlertType.error,
            "assets/raw/error.json");
      }
      return;
    }
    person.value = "Unknown User";
    status.value = 2;
    showLottieDialog("Unknown User", "User not found", AlertType.error,
        "assets/raw/error.json");
  }

  double euclideanDistance(List? e1, List? e2) {
    if (e1 == null || e2 == null) throw Exception("Null argument");

    double sum = 0;
    for (int i = 0; i < e1.length; i++) {
      sum += pow((e1[i] - e2[i]), 2);
    }

    return sqrt(sum);
  }
}
