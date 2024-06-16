import 'dart:io';
import 'package:cnfaceattendance/utils/backgrounddecoration.dart';
import 'package:cnfaceattendance/view/login_screen/widget/customtextformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/appconstants.dart';
import '../login_screen/widget/custombutton_widget.dart';
import 'companyprofilesetup_controller.dart';

class CompanyProfileSetupScreen extends StatelessWidget {
  const CompanyProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Get.put(CompanyProfileSetupController());
    return Form(
      key: model.formKey,
      child: Obx(
        () => Container(
          decoration: backgroundDecoration(),
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  'Company Details',
                    style: TextStyle(color: Colors.white,)
                ),
              ),
              bottomNavigationBar: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 3, left: 15, right: 15, bottom: 10),
                  child: CustomButtonWidget(
                      text: 'Save Detail',
                      callback: () {
                        model.saveDetailCliked(
                            model.companyNameController.text,
                            model.addressController.text,
                            model.primaryEmailController.text,
                            model.secondaryEmailController.text,
                            model.contactNumberController.text);
                      }),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                          child: InkWell(
                        onTap: () {
                          model.getImageFromGallery();
                        },
                        borderRadius: BorderRadius.circular(70),
                        child: Stack(
                          children:[ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: model.cameraImage.value.isEmpty
                                ? model.image.value != ""
                                    ? Image.network(
                                        model.image.value,
                                        fit: BoxFit.cover,
                                        width: 120,
                                        height: 120,
                                      )
                                    : Image.asset(
                                        dummyprofile,
                                        fit: BoxFit.cover,
                                        width: 120,
                                        height: 120,
                                      )
                                : Image.file(
                                    File(model.cameraImage.value.toString()),
                                    fit: BoxFit.cover,
                                    width: 120,
                                    height: 120,
                                  ),
                          ),Padding(
                            padding:
                            const  EdgeInsets.only(top: 80, left: 80),
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(40),
                                color: Colors.lightBlue,
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          )]
                        ),
                      )),
                      CustomTextFormFieldWidget(
                        controller: model.companyNameController,
                        labeltext: 'Company name',
                        isObsure: false,
                        type: InputTextType.name,
                      ),
                      CustomTextFormFieldWidget(
                          controller: model.addressController,
                          labeltext: 'Company Address',
                          isObsure: false,
                          type: InputTextType.streetAddress),
                      CustomTextFormFieldWidget(
                          controller: model.primaryEmailController,
                          labeltext: 'Primary Email',
                          isObsure: false,
                          type: InputTextType.emailaddress),
                      CustomTextFormFieldWidget(
                          controller: model.secondaryEmailController,
                          labeltext: 'Secondary Email',
                          isObsure: false,
                          type: InputTextType.emailaddress),
                      CustomTextFormFieldWidget(
                        controller: model.contactNumberController,
                        labeltext: 'Contact Number',
                        isObsure: false,
                        type: InputTextType.number,
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
