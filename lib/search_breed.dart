import 'dart:async';
import 'dart:convert';

import 'package:animal/Controller/pageViewController.dart';
import 'package:animal/constant.dart';
import 'package:animal/model/pet_breed_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class BreedSearch extends StatefulWidget {
  String peTypeId;
  BreedSearch(this.peTypeId);
  @override
  _BreedSearchState createState() => _BreedSearchState();
}

class _BreedSearchState extends State<BreedSearch> {
  List<PetBreedModel> petBreedList = <PetBreedModel>[];
  var token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTBhNjAzNTZkMTVlNDdlMmNlN2NlODIwZWFiYWJmZDA5NWIzYjM5ZDQwY2NmMjJhN2FiZjFiYTExMjliNTEzZTM3NjJjMjlmYmVlNzBiZjkiLCJpYXQiOjE2OTcxODk3NTMuMjkxODEsIm5iZiI6MTY5NzE4OTc1My4yOTE4MTEsImV4cCI6MTcyODgxMjE1My4yODg5MjEsInN1YiI6IjciLCJzY29wZXMiOltdfQ.iB7mOfoh9uFTDwoWRsEnjgToFftA7RBJmmN3AkrgBY8SRgz0Gzk1i5OKd3WEG37KJ7RGjvxUVOkoOc6wRugU7Z_lWiYsiBiEwwS3bGyQbng_8ZaruC0llBo-kfhIjvJOS-CIrpF7RtLQerLXECuYPt8Yl2lfiKExCpvLNhc7Dar65r1FFv8xajKLH0Loh73KWruahO69X3kCYpoue92Q7L5cH2HgfUGl-DyAH2uHFyF6PUqjXrrxVLCE0DTx3909hmLjNqZR70Vb47u2v5Ig1nZaPxPIEOdQhjG7_5fZe_2R6PEb6NQf-msk35_MCrGnKA0vrGQUGKtHxXKHaIUNRZ5TI1JYy5VtzCNYPsxwUQn1bh8TLJyBGLlAyGpXIrPD1rguKxP3KKxtn2RFlIFkimchrC0AnDllOUc8Li98RvzlBd054lxdgbecOndQnbwizB3OawvREI8QEUYXfF1m_UlelOSO6zCmIdx9aMQX8fgVpdDOtVpdBP71DNj2aI5GLIX0PX-lvWAnrU3KCMAzkCHMenLeRi7xSoaAzbJPQEXNmPFfnTcHFEl8ZKGKiZZWz0pnAgN9N2JEsnN8NV8H2ds871F7BF8USAGaiiLRYivvmXrh_ozEKJH_LKh_va4T1wVH0iAAY7FjXVFsoyuK9dvYRgX0rIVe0YmIXvSJSjI";

  var url = "https://petshop.octazeal.com/api/v1/";
  getPetBreed() async {
    try {
      petBreedList.clear();
      var response = await http.get(
        Uri.parse("${url}customer/pet_management/breeds/'${widget.peTypeId}'"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in jsonData) {
          setState(() {
            petBreedList.add(PetBreedModel.fromJson(index));
          });
        }
        print("Pet Breeds list ${petBreedList.length}");
      }
    } catch (e) {
      print("Error $e");
    }
  }

  TextEditingController searchController = TextEditingController();
//  List<Map<String, dynamic>> filteredItems = [];
  List<PetBreedModel> filteredItems = [];
  var petBreedId = '';
  var controller = Get.put(PetController());
  @override
  void initState() {
    super.initState();
    
    //filteredItems = List.from(items);
    filteredItems = List.from(controller.petBreedList);
    getPetBreed();
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
        filteredItems = controller.petBreedList
            .where((e) => e.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
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
              child: ListView.builder(
                      itemCount: petBreedList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                           petBreedList[index].name.toString()),
                          onTap: () {
                            // Handle item selection here, e.g., update the search field.

                            searchController.text =
                                filteredItems[index].name.toString();

                                 searchController.text =
                                filteredItems[index].name.toString();
                            petBreedId = filteredItems[index].id.toString();
                            controller.petBreedId.value = petBreedId;

                            print("pet Breed Id $petBreedId");
                            print("Selected Dog: ${filteredItems[index].name}");
                          },
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
