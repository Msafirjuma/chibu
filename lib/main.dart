import 'package:cnfaceattendance/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'google_sans',
        //  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        scaffoldBackgroundColor: Colors.transparent,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 0, backgroundColor: Colors.transparent),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
            iconTheme: IconThemeData(color: Colors.white),actionsIconTheme: IconThemeData(color: Colors.white)),
      ),
      home: const SplashScreen(),
    );
  }
}
