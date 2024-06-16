import 'package:cnfaceattendance/utils/appconstants.dart';
import 'package:cnfaceattendance/utils/backgrounddecoration.dart';
import 'package:cnfaceattendance/utils/image.dart';
import 'package:cnfaceattendance/view/home_screen/homescreen_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Get.put(HomeScreenController());
    return Container(
      decoration: backgroundDecoration(),
      child: Obx(
        () => Scaffold(
          extendBody: true,
          appBar: AppBar(
            elevation: 0,
            actions: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child:  Image.network(
                              model.companyImage.value,  errorBuilder: (context, error, stackTrace) {
                                return const CustomImage(size: 45);
                              },
                              fit: BoxFit.cover,
                              width: 45,

                            ))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.companyName.value != ""
                        ? model.companyName.value
                        : '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                      model.companyAddress.value != ""
                          ? model.companyAddress.value
                          : '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    model.checkPassword();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.settings, color: Colors.white, size: 28),
                  ))
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            animationCurve: Curves.linear,
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            color: appThemeColor,
            index: model.bottomNavIndex.value,
            height: 55,
            buttonBackgroundColor: Colors.blueAccent,
            items: const <Widget>[
              Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
              Padding(
                padding:  EdgeInsets.all(10.0),
                child: Icon(Icons.home, color: Colors.white, size: 30),
              ),
              Icon(Icons.notifications_active, color: Colors.white)
            ],
            onTap: (value) {
              model.bottomNavIndex.value = value;
            },
          ),
          body: model.pages[model.bottomNavIndex.value],
        ),
      ),
    );
  }
}
