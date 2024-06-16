
import 'package:cnfaceattendance/repository/getcompanydetailsrepository.dart';
import 'package:cnfaceattendance/repository/updatecompanyrepository.dart';
import 'package:cnfaceattendance/utils/alertbox.dart';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CompanyProfileSetupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final updatecompanyrepository = UpdateCommpanyDetailsRepository();
  final getcompanydetailsrepository = GetCompanyDetailsRepository();

  final companyNameController = TextEditingController();
  final addressController = TextEditingController();
  final primaryEmailController = TextEditingController();
  final secondaryEmailController = TextEditingController();
  final contactNumberController = TextEditingController();

  var name = ''.obs;
  RxString cameraImage = ''.obs;
  final picker = ImagePicker();
  RxString image = ''.obs;

  void saveDetailCliked(
    String name,
    String address,
    String primaryemail,
    String secondaryemail,
    String primarycontactno,
  ) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    updateCompanyDetailsApi(
        name, address, primaryemail, secondaryemail, primarycontactno);
  }
 Future <void> uploadImage()async{

  }

  Future getImageFromGallery() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      cameraImage.value = pickedFile.path;
    }
  }

  Future<void> updateCompanyDetailsApi(
    String name,
    String address,
    String primaryemail,
    String secondaryemail,
    String primarycontactno,
  ) async {
    try {

      customLoader();
      await updatecompanyrepository.updateCompanydetailsFromApi(
          cameraImage.value,
          name,
          address,
          primaryemail,
          secondaryemail,
          primarycontactno);

      Get.back();

      showAlert('Company details has been updated');
    } catch (e) {
      Get.back();
      showAlert(e.toString());
    }
  }

  Future<void> getCompanyDetails() async {
    try {
      customLoader();
      var response = await getcompanydetailsrepository.getCompanyDetails();
      Get.back();

      image.value = response.data.image;
      name.value = response.data.name;
      companyNameController.text = response.data.name;
      addressController.text = response.data.address;
      primaryEmailController.text = response.data.primaryEmail;
      secondaryEmailController.text = response.data.secondaryEmail;
      contactNumberController.text = response.data.primaryContactNo;
    } catch (e) {
      Get.back();
      showAlert(e.toString());
    }
  }

  @override
  void onReady() {
    getCompanyDetails();
    super.onReady();
  }
}
