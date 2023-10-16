import 'package:animal/Controller/pageViewController.dart';
import 'package:animal/Controller/reminder_controller.dart';
import 'package:animal/constant.dart';
import 'package:animal/main.dart';
import 'package:animal/record_details_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HiAnik extends StatefulWidget {
  const HiAnik({super.key});

  @override
  State<HiAnik> createState() => _HiAnikState();
}

class _HiAnikState extends State<HiAnik> {
  var controller = Get.put(PetController());
  var reminderCon = Get.put(ReminderController());
  @override
  Widget build(BuildContext context) {
    controller.getPetReminderTypeList();
    print(controller.reminderTypeList.length);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hi Anik Rifet!",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 135,
                child: Obx(() => controller.isLoading.value == false
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.petList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  height: 130,
                                  width: 170,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.petList[index].name}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: const BoxDecoration(
                                            color: Color(0xffE6E6FA),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(5))),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.note,
                                              size: 20,
                                              color: SolidlavenderColor,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '1 record',
                                              style: TextStyle(
                                                color: SolidlavenderColor,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: const BoxDecoration(
                                            color: Color(0xffE6E6FA),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(5))),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons
                                                  .notification_important_outlined,
                                              color: SolidlavenderColor,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '1 remember',
                                              style: TextStyle(
                                                color: SolidlavenderColor,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 30,
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            print('Button pressed');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.deepOrange,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  10.0), // Set the border radius
                                            ),
                                          ),
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          label: const Text(
                                            'Add Record',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        })
                    : Center(
                        child: CircularProgressIndicator(),
                      )),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Get.to(PageViewExample());
                },
                child: Container(
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: SolidlavenderColor,
                      ),
                      Text(
                        'Add Pet',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: SolidlavenderColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Upcoming reminders',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                  height: 350,
                  child: Obx(() => controller.isLoading.value == false
                      ? ListView.builder(
                          itemCount: reminderCon.reminderList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    decoration: const BoxDecoration(
                                        color: Color(0xffE6E6FA),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: const Text(
                                                'Flea & tick treatment',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: const Text(
                                                'Doggy-Oct 12, 2023 at 11:15 PM',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                              color: Colors.white),
                                          child: const Text(
                                            'This month',
                                            style: TextStyle(
                                              color: SolidlavenderColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    height: 80,
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    decoration: const BoxDecoration(
                                        color: Color(0xffE6E6FA),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 40,
                                          alignment: Alignment.center,
                                          width: 120,
                                          decoration: const BoxDecoration(
                                              color: Colors.white),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.check,
                                                size: 15,
                                                color: SolidlavenderColor,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                'Complete',
                                                style: TextStyle(
                                                  color: SolidlavenderColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RecordsDetailsPage()));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 120,
                                            height: 40,
                                            decoration: const BoxDecoration(
                                                color: Colors.white),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.eye,
                                                  size: 10,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                const Text(
                                                  'View record',
                                                  style: TextStyle(
                                                    color: SolidlavenderColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                      : Center(child: CircularProgressIndicator())))
            ],
          ),
        ),
      ),
    );
  }
}
