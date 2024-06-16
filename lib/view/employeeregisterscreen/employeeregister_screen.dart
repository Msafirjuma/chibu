import 'package:cnfaceattendance/utils/alertbox.dart';
import 'package:cnfaceattendance/utils/backgrounddecoration.dart';
import 'package:cnfaceattendance/utils/customborderradius.dart';
import 'package:cnfaceattendance/view/employeeregisterscreen/employeeregistercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeRegisterScreen extends StatelessWidget {
  const EmployeeRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EmployeeRegisterController model =
        Get.put(EmployeeRegisterController());
    return Container(
      decoration: backgroundDecoration(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Employee(s)',
              style: TextStyle(
                color: Colors.white,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                  onTap: () {
                    model.goToNewEmployee();
                  },
                  child: const Icon(
                    Icons.add,
                    size: 25,
                  )),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await model.getUserListFromApi();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Obx(
              () => ListView.builder(
                  itemCount: model.userlist.length,
                  itemBuilder: (BuildContext context, index) {
                    final employee = model.userlist[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: borderRadius(),
                        color: Colors.white12,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                model.goToEditEmployee(employee.userId);
                              },
                              child: Icon(
                                employee.shifttype == 'morning'
                                    ? Icons.sunny_snowing
                                    : employee.shifttype == 'day'
                                        ? Icons.sunny
                                        : employee.shifttype == 'night'
                                            ? Icons.nights_stay
                                            : Icons.nightlight_sharp,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  model.goToEditEmployee(employee.userId);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    employee.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                final faceIdCount = await model
                                    .getFaceIdCountUser(employee.userId);
                                dilogBoxForFaceId(
                                    faceIdCount,
                                    Icons.face_retouching_natural,
                                    'FaceID',
                                    'Do you want save or delete faceId ?', () {
                                  Get.back();
                                  model.scanFaceId(
                                      employee.userId, employee.name);
                                }, () {
                                  Get.back();
                                  model.deleteFaceIDFromApi(employee.userId);
                                });
                              },
                              child: const Icon(
                                Icons.face_retouching_natural,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                model.goToEditEmployee(employee.userId);
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                customDilogBox(Icons.delete, 'Delete User',
                                    'Are you sure want to delete ?', () {
                                  Get.back();
                                  model.deleteUserFromApi(employee.userId);
                                });
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 28,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
