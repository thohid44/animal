import 'package:animal/Controller/pageViewController.dart';
import 'package:animal/constant.dart';
import 'package:animal/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BreedSearch extends StatefulWidget {
  String id;
  BreedSearch(this.id);
  @override
  _BreedSearchState createState() => _BreedSearchState();
}

class _BreedSearchState extends State<BreedSearch> {
  var controller = Get.put(PetController());

  List<Map<String, dynamic>> dogData = [
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
  var petBreedId = '';
  List<Map<String, dynamic>> filteredDogData = [];

  @override
  void initState() {
    filteredDogData = List.from(dogData);
    super.initState();
  }

  void filterDogs(String query) {
    setState(() {
      filteredDogData = dogData
          .where(
              (dog) => dog['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(color: lavenderColor),
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
                    height: 45,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: TextField(
                      onChanged: (value) {
                        filterDogs(value);
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
              child: ListView.builder(
                itemCount: filteredDogData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(filteredDogData[index]['name']),
                      onTap: () {
                        // Handle selecting a dog
                        petBreedId = filteredDogData[index]['id'].toString();
                        controller.petBreedId.value = petBreedId;

                        print("pet Breed Id $petBreedId");
                        print(
                            "Selected Dog: ${filteredDogData[index]['name']}");
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
