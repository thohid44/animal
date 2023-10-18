import 'dart:io';

import 'package:animal/Controller/pageViewController.dart';
import 'package:animal/add_record_page.dart';
import 'package:animal/constant.dart';
import 'package:animal/hi_anik_rifat.dart';
import 'package:animal/onBoarding.dart';

import 'package:animal/search_breed.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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
      home: AddRecordPage(),
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
  Future uploadImage() async {
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
    var addUrl =
        "https://petshop.octazeal.com/api/v1/customer/pet_management/add";

    Future upProfile() async {
      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTBhNjAzNTZkMTVlNDdlMmNlN2NlODIwZWFiYWJmZDA5NWIzYjM5ZDQwY2NmMjJhN2FiZjFiYTExMjliNTEzZTM3NjJjMjlmYmVlNzBiZjkiLCJpYXQiOjE2OTcxODk3NTMuMjkxODEsIm5iZiI6MTY5NzE4OTc1My4yOTE4MTEsImV4cCI6MTcyODgxMjE1My4yODg5MjEsInN1YiI6IjciLCJzY29wZXMiOltdfQ.iB7mOfoh9uFTDwoWRsEnjgToFftA7RBJmmN3AkrgBY8SRgz0Gzk1i5OKd3WEG37KJ7RGjvxUVOkoOc6wRugU7Z_lWiYsiBiEwwS3bGyQbng_8ZaruC0llBo-kfhIjvJOS-CIrpF7RtLQerLXECuYPt8Yl2lfiKExCpvLNhc7Dar65r1FFv8xajKLH0Loh73KWruahO69X3kCYpoue92Q7L5cH2HgfUGl-DyAH2uHFyF6PUqjXrrxVLCE0DTx3909hmLjNqZR70Vb47u2v5Ig1nZaPxPIEOdQhjG7_5fZe_2R6PEb6NQf-msk35_MCrGnKA0vrGQUGKtHxXKHaIUNRZ5TI1JYy5VtzCNYPsxwUQn1bh8TLJyBGLlAyGpXIrPD1rguKxP3KKxtn2RFlIFkimchrC0AnDllOUc8Li98RvzlBd054lxdgbecOndQnbwizB3OawvREI8QEUYXfF1m_UlelOSO6zCmIdx9aMQX8fgVpdDOtVpdBP71DNj2aI5GLIX0PX-lvWAnrU3KCMAzkCHMenLeRi7xSoaAzbJPQEXNmPFfnTcHFEl8ZKGKiZZWz0pnAgN9N2JEsnN8NV8H2ds871F7BF8USAGaiiLRYivvmXrh_ozEKJH_LKh_va4T1wVH0iAAY7FjXVFsoyuK9dvYRgX0rIVe0YmIXvSJSjI";

      var url = Uri.parse(addUrl);

      //multipart post
      http.MultipartRequest request = http.MultipartRequest('POST', url);

      request.fields['name'] = "Dog 14";
      request.fields['pet_type'] = "8";
      request.fields['pet_breed'] = "7";
      request.fields['birth_date'] = "2023-10-16";
      request.fields['gender'] = "male";

      request.headers.addAll(
        {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
      );

      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath("image", file!.path);

      request.files.add(multipartFile);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print(" koli ${response.request}");
        Get.snackbar("Image", "Dog Successfully Upload");
        Get.to(HiAnik());
      }

      return response.statusCode;
    }

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
                          height: 40,
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
                          height: 20,
                        ),

                        Obx(() => controller.isLoading.value == false
                            ? Container(
                                height: 350,
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
                                          
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                petTypeId = controller
                                                    .petTypeList[index].id
                                                    .toString();

                                                return BreedSearch(petTypeId);
                                              });
                                        },
                                        child: Container(
                                            margin: EdgeInsets.all(8),
                                            alignment: Alignment.center,
                                            height: 110,
                                            width: 130,
                                            decoration: BoxDecoration(
                                                color: lavenderColor),
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
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )),
                                      );
                                    }))
                            : Center(child: CircularProgressIndicator())),
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
                        InkWell(
                          onTap: () {
                            uploadImage();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: lavenderColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: FaIcon(FontAwesomeIcons.camera),
                          ),
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
                      upProfile();
                      // controller.addPet(
                      //     imgPath: file!.path,
                      //     petName: dataFromPage1.toString(),
                      //     gender: gender,
                      //     petTypeId: petTypeId,
                      //     birthDate: "13-10-2023");
                    }
                    //  controller.registration();
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
