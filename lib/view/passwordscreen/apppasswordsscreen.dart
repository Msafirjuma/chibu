import 'package:cnfaceattendance/utils/appconstants.dart';
import 'package:cnfaceattendance/utils/backgrounddecoration.dart';

import 'package:cnfaceattendance/view/passwordscreen/apppasswordscreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/image.dart';

class PasswordScreen extends StatelessWidget {
  PasswordScreen({super.key});

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Get.put(PasswordScreenController());
    return Container(
      decoration: backgroundDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Settings',
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: Image.network(
                          model.companyImage.value,
                          errorBuilder: (context, error, stackTrace) {
                            return const CustomImage(size: 140);
                          },
                          fit: BoxFit.cover,
                          width: 140,
                          height: 140,
                        ))),
                Center(
                    child: Text(
                  model.companyName.value != "" ? model.companyName.value : '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Form(
                    key: model.formKey,
                    child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is empty';
                        }

                        return null;
                      },
                      onTapOutside: (e) {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                      controller: passwordController,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: Colors.white12,
                          suffixIcon: InkWell(
                            onTap: () {
                              model.checkPassword(passwordController.text);
                            },
                            child: const Icon(
                              Icons.arrow_forward,
                              size: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(10))),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(10))),
                          labelText: 'Enter Password',
                          labelStyle: const TextStyle(color: Colors.white)),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Visibility(
                    visible: isDemo ? true : false,
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "Password: ${model.appPassword.value}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )),
                const Visibility(
                    visible: isDemo ? true : false,
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "(Password displayed only in Demo Version)",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
