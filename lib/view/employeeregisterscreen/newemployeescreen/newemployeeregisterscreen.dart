import 'dart:io';

import 'package:cnfaceattendance/utils/backgrounddecoration.dart';
import 'package:cnfaceattendance/utils/customborderradius.dart';
import 'package:cnfaceattendance/view/employeeregisterscreen/newemployeescreen/widget/datepicker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/appconstants.dart';
import '../../login_screen/widget/custombutton_widget.dart';
import '../../login_screen/widget/customtextformfield_widget.dart';

import 'newemployeeregistercontroller.dart';

class NewEmployeeRegisterScreen extends StatelessWidget {
  NewEmployeeRegisterScreen({super.key});

  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNoController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Get.put(NewEmployeeRegisterController());

    return Container(
      decoration: backgroundDecoration(),
      child: Form(
        key: model.formkey,
        child: Scaffold(
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: CustomButtonWidget(
                    text: 'Create Employee',
                    callback: () {
                      model.saveDetailCliked(
                          nameController.text,
                          dobController.text,
                          emailController.text,
                          mobileNoController.text,
                          addressController.text);
                    }),
              ),
            ),
            appBar: AppBar(
              elevation: 0,
              title: const Text('New Employee',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Obx(
                        () => InkWell(
                            onTap: () {
                              model.getImageFromCamera();
                            },
                            borderRadius: BorderRadius.circular(75),
                            child: model.image.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: Image.file(
                                      File(model.image.toString()),
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 120,
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundImage:
                                        const AssetImage(dummyprofile),
                                    minRadius: 70,
                                    maxRadius: 70,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 100, left: 80),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          color: Colors.lightBlue,
                                        ),
                                        child: const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  )),
                      ),
                    ),
                    CustomTextFormFieldWidget(
                      controller: nameController,
                      labeltext: 'Employee name',
                      isObsure: false,
                      type: InputTextType.name,
                    ),
                    DatePickerWidget(
                        labeltext: 'yyyy-mm-dd', controller: dobController),
                    CustomTextFormFieldWidget(
                        controller: emailController,
                        labeltext: 'Email',
                        isObsure: false,
                        type: InputTextType.emailaddress),
                    CustomTextFormFieldWidget(
                        controller: mobileNoController,
                        labeltext: 'Mobile Number',
                        isObsure: false,
                        type: InputTextType.number),
                    CustomTextFormFieldWidget(
                        controller: addressController,
                        labeltext: 'Address',
                        isObsure: false,
                        type: InputTextType.streetAddress),
                    const SizedBox(
                      height: 18,
                    ),
                    Obx(
                      () => DropdownButtonFormField2(
                        isExpanded: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:const  EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: borderRadius(),
                          ),
                        ),
                        items: model.getshift
                            .map((item) => DropdownMenuItem(
                                  value: item.title.toString(),
                                  child: Text(
                                    item.title.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))
                            .toList(),
                        value: model.selectedValue.value,
                        onChanged: (value) {
                          model.selectedValue.value = value!;
                        },
                        dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        icon: const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Obx(
                      () => DropdownButtonFormField2(
                        isExpanded: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:const  EdgeInsets.symmetric(vertical: 16),
                          border:
                              OutlineInputBorder(borderRadius: borderRadius()),
                        ),
                        items: model.getDepartment
                            .map((item) => DropdownMenuItem(
                                  value: item.departmentname.toString(),
                                  child: Text(
                                    item.departmentname.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))
                            .toList(),
                        value: model.selectedDepartmentValue.value,
                        onChanged: (value) {
                          model.selectedDepartmentValue.value = value!;
                        },
                        dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        icon: const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
