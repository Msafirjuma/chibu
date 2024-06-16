import 'package:cnfaceattendance/model/isarmodel/usermodel.dart';
import 'package:cnfaceattendance/repository/updateuserrepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

import '../../../model/departmentModel.dart';
import '../../../model/shiftmodel.dart';
import '../../../repository/departmentrepository.dart';
import '../../../repository/shiftrepositiory.dart';
import '../../../utils/alertbox.dart';

class EditEmployeeController extends GetxController {
  final formkey1 = GlobalKey<FormState>();
  final repositiory = ShiftRepositiory();
  final updaterepository = UpdateUserRepositiory();
  final departmentrepository = DepartmentRepository();
  final getshift = <ShiftModel>[].obs;
  final getDepartment = <DepartmentModel>[].obs;

  int userId = 0;
  RxString cameraImage = ''.obs;
  RxString image = ''.obs;
  final picker = ImagePicker();
  RxString selectedValue = ''.obs;
  RxString selectedDepartmentValue = ''.obs;

  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNoController = TextEditingController();
  final addressController = TextEditingController();

  Future getImageFromCamera() async {
    var pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      cameraImage.value = pickedFile.path.toString();
    }
  }

  void saveEditCliked(
      String name, String dob, String email, String mobile, String address) {
    if (!formkey1.currentState!.validate()) {
      return;
    }
    updateUserApi(name, dob, email, mobile, address);
  }

  @override
  void onInit() async {
    userId = await Get.arguments["userId"] ?? 0;
    getAllShift();
    getAllDepartment();
    getUserByuserId(userId);
    super.onInit();
  }

  late User? user;

  void getUserByuserId(int userId) async {
    user = await updaterepository.getUserFromuserId(userId);
    if (user == null) {
      return;
    }
    image.value = user!.image;
    nameController.text = user!.name;
    dobController.text = user!.dob;
    emailController.text = user!.email;
    mobileNoController.text = user!.mobile;
    addressController.text = user!.address;
  }

  void updateUserApi(String name, String dob, String email, String mobile,
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
      await updaterepository.updateUser(cameraImage.value, name, dob, email,
          mobile, address, shiftid, userId, departmentId);

      user!
        ..shiftId = shiftid
        ..departmentId = departmentId
        ..address = address
        ..dob = dob
        ..email = email
        ..name = name
        ..mobile = mobile
        ..image = cameraImage.value;

      updaterepository.createUser(user!);
      showAlert('Employee has been edited');

      Get.back(closeOverlays: true);
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
      selectedValue.value =
          getshift.where((element) => element.id == user!.shiftId).first.title;
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
      selectedDepartmentValue.value = getDepartment
          .where((element) => element.id == user!.departmentId)
          .first
          .departmentname;
    } catch (e) {
      showAlert(e.toString());
    }
  }
}
