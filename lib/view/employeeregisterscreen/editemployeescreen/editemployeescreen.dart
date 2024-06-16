import 'dart:io';
import 'package:cnfaceattendance/utils/backgrounddecoration.dart';
import 'package:cnfaceattendance/utils/customborderradius.dart';
import 'package:cnfaceattendance/view/employeeregisterscreen/editemployeescreen/editemployeecontroller.dart';
import 'package:cnfaceattendance/view/employeeregisterscreen/newemployeescreen/widget/datepicker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/image.dart';
import '../../login_screen/widget/custombutton_widget.dart';
import '../../login_screen/widget/customtextformfield_widget.dart';

class EditEmployeeScreen extends StatelessWidget {
  const EditEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Get.put(EditEmployeeController());

    return Container(
      decoration: backgroundDecoration(),
      child: Form(
        key: model.formkey1,
        child: Scaffold(
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: CustomButtonWidget(
                    text: 'Save Employee',
                    callback: () {
                      model.saveEditCliked(
                          model.nameController.text,
                          model.dobController.text,
                          model.emailController.text,
                          model.mobileNoController.text,
                          model.addressController.text);
                    }),
              ),
            ),
            appBar: AppBar(
              elevation: 0,
              title: const Text(
                'Edit Employee',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
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
                            child: Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(70),
                                child: model.cameraImage.value.isEmpty
                                    ? Image.network(
                                        model.image.value,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const CustomImage(size: 120);
                                        },
                                        fit: BoxFit.cover,
                                        width: 120,
                                        height: 120,
                                      )
                                    : Image.file(
                                        File(
                                            model.cameraImage.value.toString()),
                                        fit: BoxFit.cover,
                                        width: 120,
                                        height: 120,
                                      ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 80, left: 80),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.lightBlue,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              )
                            ])),
                      ),
                    ),
                    CustomTextFormFieldWidget(
                      controller: model.nameController,
                      labeltext: 'Employee name',
                      isObsure: false,
                      type: InputTextType.name,
                    ),
                    DatePickerWidget(
                        labeltext: 'yyyy-mm-dd',
                        controller: model.dobController),
                    CustomTextFormFieldWidget(
                        controller: model.emailController,
                        labeltext: 'Email',
                        isObsure: false,
                        type: InputTextType.emailaddress),
                    CustomTextFormFieldWidget(
                        controller: model.mobileNoController,
                        labeltext: 'Mobile Number',
                        isObsure: false,
                        type: InputTextType.number),
                    CustomTextFormFieldWidget(
                        controller: model.addressController,
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
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
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
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
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
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
