import 'package:cnfaceattendance/utils/appconstants.dart';
import 'package:cnfaceattendance/utils/backgrounddecoration.dart';
import 'package:cnfaceattendance/view/login_screen/login_controller.dart';
import 'package:cnfaceattendance/view/login_screen/widget/custombutton_widget.dart';
import 'package:cnfaceattendance/view/login_screen/widget/customtextformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Get.put(LoginController());

    return Container(
      decoration: backgroundDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: model.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                  appIcon,
                  height: 90,
                )),
                const SizedBox(height: 60),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                CustomTextFormFieldWidget(
                  controller: emailController,
                  labeltext: 'Email',
                  isObsure: false,
                  type: InputTextType.emailaddress,
                ),
                CustomTextFormFieldWidget(
                  controller: passwordController,
                  labeltext: 'Password',
                  isObsure: true,
                  type: InputTextType.password,
                ),
                const SizedBox(height: 20),
                CustomButtonWidget(
                    text: 'Login',
                    callback: () {
                      model.loginClicked(
                          emailController.text, passwordController.text);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
