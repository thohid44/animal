import 'dart:io';

import 'package:animal/Controller/pageViewController.dart';
import 'package:animal/constant.dart';
import 'package:animal/hi_anik_rifat.dart';
import 'package:animal/onBoarding.dart';

import 'package:animal/search_breed.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trip Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
      ),
      home: PageViewExample(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class PageViewExample extends StatefulWidget {
  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  String dataFromPage1 = '';
  String petTypeId = '';
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

  var controller = Get.put(PetController());


  @override
  Widget build(BuildContext context) {
    // controller.getPetType();
   controller.getPetBreed();

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                  children: <Widget>[
                    PageOne(dataFromPage1, (value) {
                      setState(() {
                        dataFromPage1 = value;
                        print("Value print form Page View $dataFromPage1");
                      });
                    }),

                    // start Page Two
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: lavenderColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 20,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: const Text(
                            "What's Your Pet Gender",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                            height: 50,
                            child: ListTile(
                              title: Text(
                                "Female",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                              trailing: Radio(
                                  value: "Female",
                                  groupValue: gender,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.deepOrange),
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                      print(gender);
                                    });
                                  }),
                            )),
                        Container(
                            height: 50,
                            child: ListTile(
                              title: Text(
                                "Male",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                              trailing: Radio(
                                  value: "Male",
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.deepOrange),
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                      print(gender);
                                    });
                                  }),
                            )),
                      ],
                    ),

                    // End Page Two

                    //Start Page Three
                    Column(
                      children: [
//SizedBox(height: 50,),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: lavenderColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 20,
                                  )),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: const Text(
                            "What's kind of a pet do \n you have",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                       Obx(() => controller.isLoading.value== false? Container(
                            height: 400,
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisExtent: 120,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 9 / 16),
                                itemCount: controller.petTypeList.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {

                                        //  controller.petBreedsId.value = controller.petTypeList[index].id.toString();
                                        //  print("koli ${controller.petBreedsId.value } ");
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            petTypeId = controller.petTypeList[index].id.toString();
                                         
                                            return BreedSearch(petTypeId);
                                          });
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(8),
                                        alignment: Alignment.center,
                                        height: 110,
                                        width: 130,
                                        decoration:
                                            BoxDecoration(color: lavenderColor),
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 80,
                                                width: 110,
                                                child: Image.network(
                                                    "${controller.petTypeList[index].icon}")),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "${controller.petTypeList[index].name}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )),
                                  );
                                })):Center(child: CircularProgressIndicator())),
                        // Container(
                        //   height: 100,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       InkWell(
                        //         onTap: () {
                        //           showDialog(
                        //               context: context,
                        //               builder: (context) {
                        //                 return BreedSearch(petBreedId);
                        //               });
                        //           print(petBreedId);
                        //         },
                        //         child: Container(
                        //           alignment: Alignment.center,
                        //           height: 100,
                        //           width: 130,
                        //           decoration:
                        //               BoxDecoration(color: lavenderColor),
                        //           child: Text("Dog Pic"),
                        //         ),
                        //       ),
                        //       Container(
                        //         alignment: Alignment.center,
                        //         height: 100,
                        //         width: 130,
                        //         decoration: BoxDecoration(color: lavenderColor),
                        //         child: Text("Cat Pic"),
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                    //End Page Two
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: lavenderColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 20,
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(HiAnik());
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                child: const Text(
                                  "Skip",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: const Text(
                            "Add Picture",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                uploadImage();
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: lavenderColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                    icon: FaIcon(FontAwesomeIcons.camera),
                                    onPressed: () {}),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 5.0,
                        backgroundColor:
                            i == currentPage ? Colors.blue : Colors.grey,
                      ),
                    ),
                ],
              ),
              if (currentPage < 4)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Set the border radius
                    ),
                  ),
                  onPressed: () {
                    print("Pet name is $dataFromPage1");
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                    if (currentPage == 3) {
                      controller.addPet(
                          imgPath: image,
                          petName: dataFromPage1.toString(),
                          gender: gender,
                          petTypeId: petTypeId,
                          birthDate: "13-10-2023");
                    }
                  },
                  child: currentPage == 3 ? Text("Submit") : Text("Next"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  final String data;
  final Function(String) onDataChanged;

  PageOne(this.data, this.onDataChanged);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: lavenderColor,
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        const Text(
          "What's your pet name?",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Container(
          width: 300,
          child: TextField(
            onChanged: (value) {
              widget.onDataChanged(_textController.text = value);
              //print("Value print form Page One ${_textController.text}");
            },
            decoration: InputDecoration(
                hintText: "Enter you pet name",
                focusedBorder: OutlineInputBorder(),
                enabledBorder: const UnderlineInputBorder(
                  //<-- SEE HERE
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
                errorText: _textController.text.isEmpty
                    ? "Pet name can't be null!"
                    : ''),
            maxLength: 25,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Got an invite to co-parent?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "Continue here",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PageTwo extends StatefulWidget {
  final String data;
  final Function(String) onDataChanged;

  PageTwo(this.data, this.onDataChanged);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
//SizedBox(height: 50,),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: lavenderColor,
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  )),
            ),
          ],
        ),

        const SizedBox(
          height: 50,
        ),
        Container(
          child: const Text(
            "What's kind of a pet do \n you have",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 130,
              decoration: BoxDecoration(color: lavenderColor),
              child: Text("Dog Pic"),
            ),
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 130,
              decoration: BoxDecoration(color: lavenderColor),
              child: Text("Cat Pic"),
            )
          ],
        )
      ],
    );
  }
}

class PageThree extends StatefulWidget {
  // final Function(String) onDataChanged;

  // PageThree( this.onDataChanged);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  final ImagePicker _picker = ImagePicker();

  final ImagePicker picker = ImagePicker();

  imagePick() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  }

  var image;
  XFile? file;

  int showComment = 0;

  uploadImage() async {
    final XFile tempImage =
        (await _picker.pickImage(source: ImageSource.camera))!;

    setState(() {
      image = tempImage.path;
      file = tempImage;
      print(tempImage.name);
      print("image");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: lavenderColor,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    )),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: const Text(
              "Add Picture",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () async {
                  uploadImage();
                  print("object");
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: lavenderColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.camera),
                      onPressed: () {
                        print("Pressed");
                      }),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
