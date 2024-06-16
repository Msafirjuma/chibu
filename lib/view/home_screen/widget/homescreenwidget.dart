import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/appconstants.dart';
import '../../../utils/customborderradius.dart';
import '../homescreen_controller.dart';
import 'custombox.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Get.put(HomeScreenController());
    return RefreshIndicator(
      onRefresh: () async {
        await model.getDashboardFromApi();
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 18,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DigitalClock(
                is24HourTimeFormat: false,
                hourMinuteDigitTextStyle:
                    const TextStyle(fontSize: 55, color: Colors.white),
                secondDigitTextStyle:
                    const TextStyle(color: Colors.white, fontSize: 24),
                amPmDigitTextStyle:
                    const TextStyle(color: Colors.grey, fontSize: 24),
              ),
              Text(
                DateFormat('EEEE , MMMM d , yyyy').format(DateTime.now()),
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                height: 25,
              ),
              Obx(
                () => model.noticeString.isNotEmpty
                    ? Container(
                        height: 50 ,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius(),
                          color: Colors.white12,
                        ),
                        child: Center(
                          child: Marquee(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            key: Key(model.noticeString.value),
                            text: model.noticeString.value,
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                            velocity: 20,
                            scrollAxis: Axis.horizontal,
                            accelerationDuration: const Duration(seconds: 0),
                            accelerationCurve: Curves.linear,
                            decelerationDuration: const Duration(milliseconds: 0),
                            decelerationCurve: Curves.easeOut,
                          ),
                        ))
                    : Container(),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  CustomBox(
                    image: checkInImage,
                    mainText: 'Check In',
                    subText: 'Check-in for your\nattendance',
                    color: Colors.blueAccent.withOpacity(.5),
                    onpressed: () {
                      model.onCheckInClicked();
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomBox(
                      image: checkInImage,
                      mainText: 'Check Out',
                      subText: 'Check out for your\nattendance',
                      color: Colors.lightBlueAccent.withOpacity(.4),
                      onpressed: () {
                        model.onCheckOutClicked();
                      }),
                ],
              ),
              Row(
                children: [
                  CustomBox(
                      image: breakActive,
                      mainText: 'Break In',
                      subText: 'Break-in for your\nattendance',
                      color: Colors.lightGreenAccent.withOpacity(.4),
                      onpressed: () {
                        model.onBreakInClicked();
                      }),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomBox(
                      image: breakInactive,
                      mainText: 'Break Out',
                      subText: 'Break-out for your\nattendance',
                      color: Colors.yellowAccent.withOpacity(.5),
                      onpressed: () {
                        model.onBreakOutClicked();
                      }),
                ],
              ),
              Obx(
                () => model.bannerImage.value == ""
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 100),
                        child: InkWell(
                          onTap: () {
                            launchUrl(
                              Uri.parse(model.bannerUrl.value),
                              mode: LaunchMode.platformDefault,
                            );
                          },
                          child: ClipRRect(
                            borderRadius: borderRadius(),
                            child: Image.network(
                              model.bannerImage.value, errorBuilder: (context, error, stackTrace) {
                              return Container();
                            },
                              height: 200,
                              width: Get.size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
