import 'package:cnfaceattendance/model/departmentmodel.dart';
import 'package:cnfaceattendance/model/isarmodel/usermodel.dart';
import 'package:cnfaceattendance/model/shiftmodel.dart';
import 'package:cnfaceattendance/repository/departmentrepository.dart';
import 'package:cnfaceattendance/repository/userrepositiory.dart';
import 'package:cnfaceattendance/utils/alertbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../repository/shiftrepositiory.dart';

class NewEmployeeRegisterController extends GetxController {
  final formkey = GlobalKey<FormState>();
  final repositiory = ShiftRepositiory();
  final userrepository = UserRepositiory();
  final departmentrepository = DepartmentRepository();
  final getshift = <ShiftModel>[].obs;
  final getDepartment = <DepartmentModel>[].obs;

  RxString selectedValue = ''.obs;
  RxString selectedDepartmentValue = ''.obs;
  RxString image = ''.obs;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    var pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image.value = pickedFile.path.toString();
    }
  }

  void saveDetailCliked(
    String name,
    String dob,
    String email,
    String mobile,
    String address,
  ) {
    if (!formkey.currentState!.validate()) {
      return;
    }
    saveUserApi(
      name,
      dob,
      email,
      mobile,
      address,
    );
  }

  @override
  void onInit() {
    getAllShift();
    getAllDepartment();
    super.onInit();
  }

  void saveUserApi(String name, String dob, String email, String mobile,
      String address) async {
    try {
      int? shiftid = getshift
          .where((element) {
            return element.title == selectedValue.value;
          })
          .firstOrNull
          ?.id;
      if (shiftid == null) {
        showAlert('shift is empty');
        return;
      }
      int? departmentId = getDepartment
          .where((element) {
            return element.departmentname == selectedDepartmentValue.value;
          })
          .firstOrNull
          ?.id;

      if (departmentId == null) {
        showAlert('Department is empty');
        return;
      }

      customLoader();
      var response = await userrepository.saveUser(
        image.value,
        name,
        dob,
        email,
        mobile,
        address,
        shiftid,
        departmentId,
      );
      Get.back();
      userrepository.addUser(User(response!.data.userId, name, dob, email,
          mobile, address, image.value, shiftid, departmentId));
      Get.back();
    } catch (e) {
      showAlert(e.toString());
      Get.back();
    }
  }

  Future<void> getAllShift() async {
    try {
      var response = await repositiory.getAllShift();
      final shift = <ShiftModel>[];
      shift.addAll(shift);
      for (var data in response!.data) {
        shift.add(ShiftModel(data.id, data.title));
      }
      getshift.value = shift;
      selectedValue.value = getshift.first.title;
    } catch (e) {
      showAlert(e.toString());
    }
  }

  Future<void> getAllDepartment() async {
    try {
      var response = await departmentrepository.getAllDepartment();
      final department = <DepartmentModel>[];
      department.addAll(department);
      for (var data in response!.data) {
        department.add(DepartmentModel(data.id, data.title));
      }
      getDepartment.value = department;
      selectedDepartmentValue.value = getDepartment.first.departmentname;
    } catch (e) {
      showAlert(e.toString());
    }
  }
}
