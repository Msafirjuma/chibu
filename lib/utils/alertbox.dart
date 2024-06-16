import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'customborderradius.dart';

enum AlertType { warning, success, error, others, password, url }

void showLottieDialog(
    String title, String desc, AlertType type, String lottiePath) {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(lottiePath, repeat: false, width: 100, height: 100),
            Text(
              desc,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            )
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: type == AlertType.success
                  ? Colors.green
                  : type == AlertType.warning
                      ? Colors.orange
                      : Colors.red),
          child: Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Center(
              child: Text(
                "Okay",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onPressed: () {
            Get.back();
            Get.back();
          },
        ),
      ],
    ),
  );
}

void showAlertDialog(String title, String desc) {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: borderRadius()),
      elevation: 0,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning,
              color: Colors.orange,
              size: 80,
            ),
            Text(
              desc,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            )
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: borderRadius()),
            backgroundColor: Colors.blueAccent,
          ),
          child: Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Center(
              child: Text(
                "Okay",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    ),
  );
}

Icon alertIconType(AlertType type) {
  const size = 60.0;
  switch (type) {
    case AlertType.success:
      {
        return const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: size,
        );
      }
    case AlertType.warning:
      {
        return const Icon(
          Icons.warning,
          color: Colors.orange,
          size: size,
        );
      }
    case AlertType.error:
      {
        return const Icon(
          Icons.error,
          color: Colors.red,
          size: size,
        );
      }
    case AlertType.password:
      {
        return const Icon(
          Icons.key,
          color: Colors.black26,
          size: size,
        );
      }
    case AlertType.url:
      {
        return const Icon(
          Icons.link,
          color: Colors.black26,
          size: size,
        );
      }
    default:
      {
        return const Icon(
          Icons.question_mark,
          color: Colors.blueGrey,
          size: size,
        );
      }
  }
}

void customLoader() {
  Get.dialog(
    barrierDismissible: false,
    Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          width: 150,
          height: 150,
          padding: const EdgeInsets.all(40),
          child: const CircularProgressIndicator(
            backgroundColor: Colors.grey,
            color: Colors.blue,
            strokeWidth: 5,
            strokeAlign: CircularProgressIndicator.strokeAlignCenter,
          ),
        ),
      ),
    ),
  );
}

showAlert(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 14.0);
}

void customDilogBox(
    IconData icon, String title, String desc, VoidCallback confirmBtn) {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: borderRadius()),
      elevation: 0,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: 100,
            ),
            Text(
              desc,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            )
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      actionsOverflowButtonSpacing: 10,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: borderRadius()),
              backgroundColor: Colors.blue),
          onPressed: confirmBtn,
          child: Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Center(
              child: Text(
                "Okay",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: borderRadius()),
              backgroundColor: Colors.blue.shade400),
          child: Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Center(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    ),
  );
}

void customDilogBoxForAttendance(String title, String image) {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: borderRadius()),
      elevation: 0,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: ClipRRect(
              borderRadius: borderRadius(),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ),
            )),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      actionsOverflowButtonSpacing: 10,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: borderRadius()),
              backgroundColor: Colors.blue.shade400),
          child: Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Center(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    ),
  );
}

void dilogBoxForFaceId(int count, IconData icon, String title, String desc,
    VoidCallback confirmBtn, VoidCallback deleteBtn) {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: borderRadius()),
      elevation: 0,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 155,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: 100,
            ),
            Text(
              desc,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(top:5),
              child: Text(
                "Total: $count",
                style:
                const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
              ),
            )
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      actionsOverflowButtonSpacing: 10,
      contentPadding: EdgeInsets.zero,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: borderRadius()),
              backgroundColor: Colors.blue),
          onPressed: confirmBtn,
          child: Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Center(
              child: Text(
                "Save FaceId",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: borderRadius()),
                backgroundColor: Colors.blue),
            onPressed: deleteBtn,
            child: Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Center(
                child: Text(
                  "Delete FaceId",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: borderRadius()),
              backgroundColor: Colors.blue.shade400),
          child: Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Center(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    ),
  );
}
