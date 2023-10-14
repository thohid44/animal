import 'dart:async';

import 'package:animal/Controller/pageViewController.dart';
import 'package:animal/constant.dart';
import 'package:animal/model/pet_breed_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class BreedSearch extends StatefulWidget {
  String peTypeId; 
  BreedSearch(this.peTypeId);
  @override
  _BreedSearchState createState() => _BreedSearchState();
}

class _BreedSearchState extends State<BreedSearch> {

   List<Map<String, dynamic>> items = [
    {
      "id": 9,
      "name": "French Bulldogs",
      "translations": [],
    },
    {
      "id": 10,
      "name": "Labrador Retrievers",
      "translations": [],
    },
    {
      "id": 11,
      "name": "German Shepherd Dogs",
      "translations": [],
    },
    {
      "id": 12,
      "name": "Golden Retrievers",
      "translations": [],
    },
  ];

  TextEditingController searchController = TextEditingController();
//  List<Map<String, dynamic>> filteredItems = [];
  List<PetBreedModel> filteredItems= [];
  var petBreedId='';
var controller = Get.put(PetController());
  @override
  void initState() {
    super.initState();
    //filteredItems = List.from(items);
    filteredItems = List.from(controller.petBreedList);
    Timer(Duration(seconds: 2), () { 
      controller.getPetBreed();
    });
  }

  void filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
      //  filteredItems = List.from(items);
       filteredItems = List.from(controller.petBreedList);
      } else {
        // filteredItems = items
        //     .where((item) =>
        //         item['name'].toLowerCase().contains(query.toLowerCase()))
        //     .toList();
    filteredItems = controller.petBreedList.where((e) => e.name!.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("breed Id ${widget.peTypeId}");
    controller.getPetBreed();
    controller.petIdForBreeds.value = widget.peTypeId;
   print("kollll ${controller.petBreedList.length}");
    return SafeArea(
      child: Scaffold(
       
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: lavenderColor
              ),
              child: Column(
                children: [
                         Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back(); 
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text("X",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Container(
                            child: const Text(
                              "Select Breed",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    color: lavenderColor,
                    child: TextField(
                      controller: searchController,
                      onChanged: (query) {
                        filterItems(query);
                      },
                     
   decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,
                            color: Colors.grey), // Prefix search icon
                        hintText: 'Search breed', // Hint text
                        filled: true,
                        fillColor: Colors.white, // Text field color
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                      ),

                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() => controller.isLoading2.value==false? ListView.builder(
                itemCount:controller.petBreedList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.petBreedList[index].name.toString()),
                    onTap: () {
                      // Handle item selection here, e.g., update the search field.

                      searchController.text = filteredItems[index].name.toString();
                          petBreedId = filteredItems[index].id.toString();
                        controller.petBreedId.value = petBreedId;

                        print("pet Breed Id $petBreedId");
                        print(
                            "Selected Dog: ${filteredItems[index].name}");
                    },
                  );
                },
              ):Center(child: CircularProgressIndicator())),
            ),
          ],
        ),
      ),
    );
  }
}
