import 'package:animal/Controller/reminder_controller.dart';
import 'package:animal/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddRecordPage extends StatefulWidget {
  var petId;
  AddRecordPage({super.key, this.petId});

  @override
  State<AddRecordPage> createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  final TextEditingController notes = TextEditingController();

  var image;

  final ImagePicker _picker = ImagePicker();

  XFile? file;

  int showComment = 0;
  String? gender;
  uploadImage() async {
    final XFile tempImage =
        (await _picker.pickImage(source: ImageSource.camera))!;

    setState(() {
      image = tempImage.path;
      file = tempImage;
      print(tempImage.name);
      print("iamge $image");
    });
  }

  var selectReminderType;
  var isSelect = false;
  var reminderId;

  bool notificationStatus = false;
  var reminderValue;

  var controller = Get.put(ReminderController());

  List<Map<String, dynamic>> items = [
    {"id": 1, "name": "Vaccination"},
    {"id": 2, "name": "Deworming"},
    {"id": 3, "name": "Tick & Flea"},
    {"id": 4, "name": "Measurement"},
    {"id": 5, "name": "Hygiene"},
    {"id": 6, "name": "Medicine"},
    {"id": 7, "name": "Vet Visit"},
     {"id": 8, "name": "Reports"},
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Reminder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      isExpanded: true,
                      hint: Text(
                          "${isSelect ? selectReminderType : 'Select Record Type'}"),
                      underline: SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: reminderValue,
                      items: items
                          .map((e) => DropdownMenuItem(
                                onTap: () {
                                  selectReminderType = e['name'].toString();
                                },
                                value: e['id'],
                                child: Text(
                                  "${e['name']}",
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        var id = value;
                        reminderId = value;
                        print("Category Id $id");
                        // _con.getClassId(value.toString());
                        setState(() {
                          reminderId = value.toString();
                          isSelect = true;
                        });
                      })),
              SizedBox(height: 10),
              // option1
              reminderId == "1"
                  ? Container(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              administrationDatePicker(context);
                            },
                            child: Container(
                              width: 300,
                              height: 35,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey)),
                              child: adminstrationDateStatus == false
                                  ? const Text(
                                      "Administration Date",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    )
                                  : Text(
                                      "${pickAdminsDate.year}-${pickAdminsDate.month}-${pickAdminsDate.day}"),
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              expirationDatePicker(context);
                            },
                            child: Container(
                              width: 300,
                              height: 35,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey)),
                              child: exprirationDateStatus == false
                                  ? const Text(
                                      "Expiration Date",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    )
                                  : Text(
                                      "${pickExprDate.day}-${pickExprDate.month}-${pickExprDate.year}"),
                            ),
                          ),
                          // Note Text Field with Border Radius
                          SizedBox(height: 15),
                          Container(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Note',
                                hintText: 'Notes',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              maxLines: 3, // Allows multiple lines for notes
                            ),
                          ),
                              SizedBox(height: 20,),
                          SwitchListTile(
                  value: notificationStatus,
                  onChanged: (value) {
                    setState(() {
                      notificationStatus = !notificationStatus;
                      print("Notication $notificationStatus");
                    });
                  },
                  title: const Text(
                    'Reminder Notifications',
                    style: TextStyle(
                      color: SolidlavenderColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                          SizedBox(height: 20,),
                               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  InkWell(
                            onTap: () {
                            dairyDatePicker(context);
                            },
                            child: Container(
                              width: 160,
                              height: 35,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey)),
                              child: dateStatus == false
                                  ? const Text(
                                      "Select Date",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    )
                                  : Text(
                                      "${pickDate.year}-${pickDate.month}-${pickDate.day}"),
                            ),
                          ),
                    Container(
                      width: 120,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                     
                          hintText: tripTime !=null ? '$tripTime' :'select Time',
                          suffixIcon: InkWell(
                              onTap: _showTimePicker,
                              child: Icon(Icons.lock_clock)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                        ],
                      ),
                    )
                  : Container(),
              SizedBox(height: 10),
              // Option2
              reminderId == "2"||   reminderId == "3" ||  reminderId == "4" ||  reminderId == "5" ||  reminderId == "6" ||  reminderId == "7"
                  ? Column(
                    children: [
                      Container(
                                width: 300,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Note',
                                    hintText: 'Notes',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  maxLines: 3, // Allows multiple lines for notes
                                ),
                              ),
                                       SwitchListTile(
                  value: notificationStatus,
                  onChanged: (value) {
                    setState(() {
                      notificationStatus = !notificationStatus;
                      print("Notication $notificationStatus");
                    });
                  },
                  title: const Text(
                    'Reminder Notifications',
                    style: TextStyle(
                      color: SolidlavenderColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                          SizedBox(height: 20,),
                               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     InkWell(
                            onTap: () {
                            dairyDatePicker(context);
                            },
                            child: Container(
                              width: 160,
                              height: 35,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey)),
                              child: dateStatus == false
                                  ? const Text(
                                      "Select Date",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    )
                                  : Text(
                                      "${pickDate.year}-${pickDate.month}-${pickDate.day}"),
                            ),
                          ),
                    Container(
                      width: 120,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                         
                          hintText: tripTime !=null ? '$tripTime' :'select Time',
                          suffixIcon: InkWell(
                              onTap: _showTimePicker,
                              child: Icon(Icons.lock_clock)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                    ],
                  )
                  : Container(),
              SizedBox(
                height: 40,
              ),
            
           reminderId == "8"? Container(
             child: Column(children: [
              Container(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Note',
                                hintText: 'Notes',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              maxLines: 3, // Allows multiple lines for notes
                            ),
                          ),
                          SizedBox(
                height: 20,
              ),
                 Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 30,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        uploadImage();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius
                        ),
                      ),
                      icon: const Icon(
                        Icons.camera,
                        color: SolidlavenderColor,
                        size: 20,
                      ),
                      label: const Text(
                        'Photo',
                        style: TextStyle(
                          color: SolidlavenderColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius
                        ),
                      ),
                      icon: const Icon(
                        Icons.edit_document,
                        color: SolidlavenderColor,
                        size: 20,
                      ),
                      label: const Text(
                        'Documents',
                        style: TextStyle(
                          color: SolidlavenderColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
                SizedBox(
                height: 20,
              ),
            
                SwitchListTile(
                  value: notificationStatus,
                  onChanged: (value) {
                    setState(() {
                      notificationStatus = !notificationStatus;
                      print("Notication $notificationStatus");
                    });
                  },
                  title: const Text(
                    'Reminder Notifications',
                    style: TextStyle(
                      color: SolidlavenderColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                            onTap: () {
                            dairyDatePicker(context);
                            },
                            child: Container(
                              width: 160,
                              height: 35,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey)),
                              child: dateStatus == false
                                  ? const Text(
                                      "Select Date",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    )
                                  : Text(
                                      "${pickDate.year}-${pickDate.month}-${pickDate.day}"),
                            ),
                          ),
                    Container(
                      width: 120,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                    
                          hintText: tripTime !=null ? '$tripTime' :'select Time',
                          suffixIcon: InkWell(
                              onTap: _showTimePicker,
                              child: Icon(Icons.lock_clock)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
             ],),
           ): Container(height: 40,),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    controller.addReminder(
                      petId: widget.petId,
                      typeId: reminderId,
                      adminsDate: adminstrationDate,
                      exprDate: exprirationDate,
                      notes: notes.text.toString(),
                      time: pickupTime,
                      date: dateDairy,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Set the border radius
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? selectedDates;
  DateTime pickDate = DateTime.now();
  var dateDairy;
  bool dateStatus = false;
  dairyDatePicker(context) async {
    DateTime? userSelectedDate = await showDatePicker(
      context: context,
      initialDate: pickDate,
      firstDate: DateTime(2021),
     
      lastDate: DateTime(2030, 01, 01),
    );

    if (userSelectedDate == null) {
      return;
    } else {
      setState(() {
           dateStatus = true;
        pickDate = userSelectedDate;
        print(pickDate);
        dateDairy = "${pickDate.year}-${pickDate.month}-${pickDate.day}";
        print("Date $dateDairy");
      });
    }
  }

  String? selectAdmintDate;

  var adminstrationDate;

  bool adminstrationDateStatus = false;

  DateTime pickAdminsDate = DateTime.now();

  administrationDatePicker(context) async {
    DateTime? userSelectedDate = await showDatePicker(
      context: context,
      initialDate: pickAdminsDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030, 01, 01),
    );

    if (userSelectedDate == null) {
      return;
    } else {
      setState(() {
        adminstrationDateStatus = true;
        pickAdminsDate = userSelectedDate;

        adminstrationDate =
            "${pickAdminsDate.year}-${pickAdminsDate.month}-${pickAdminsDate.day}";
        print("Adminstrtion Date $adminstrationDate");
      });
    }
  }

  String? selectExprDate;
  var exprirationDate;
  bool exprirationDateStatus = false;
  DateTime pickExprDate = DateTime.now();

  expirationDatePicker(context) async {
    DateTime? userSelectedDate = await showDatePicker(
      context: context,
      initialDate: pickDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030, 01, 01),
    );

    if (userSelectedDate == null) {
      return;
    } else {
      setState(() {
        exprirationDateStatus = true;
        pickExprDate = userSelectedDate;

        exprirationDate =
            "${pickExprDate.year}-${pickExprDate.month}-${pickExprDate.day}";
        print("Expiration Date $exprirationDate");
      });
    }
  }

  var pickupTime;
  var tripTime;
  bool pickTimeStatus = false; 
  void _showTimePicker() async {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        pickTimeStatus=true;
        print(value!.hour);
        pickupTime = value;
        tripTime = pickupTime!.format(context).toString();

        print("Time Time is $tripTime");
      });
    });
  }
}


