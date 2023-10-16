import 'package:animal/constant.dart';
import 'package:animal/hi_anik_rifat.dart';
import 'package:animal/model/pet_breed_model.dart';
import 'package:animal/model/pet_list_model.dart';
import 'package:animal/model/pet_reminder_list.dart';
import 'package:animal/model/pet_reminder_model.dart';

import 'package:animal/model/pet_type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class PetController extends GetxController {
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var isProfileChangeLoading = false.obs;

  var url = "https://petshop.octazeal.com/api/v1/";
  var addUrl =
      "https://petshop.octazeal.com/api/v1/customer/pet_management/add";
  final _box = GetStorage();
  void onInit() {
    super.onInit();
    getPetType();
    getPetBreed();
    getPetList();
    getPetReminderTypeList();
  }

  var token =  "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTBhNjAzNTZkMTVlNDdlMmNlN2NlODIwZWFiYWJmZDA5NWIzYjM5ZDQwY2NmMjJhN2FiZjFiYTExMjliNTEzZTM3NjJjMjlmYmVlNzBiZjkiLCJpYXQiOjE2OTcxODk3NTMuMjkxODEsIm5iZiI6MTY5NzE4OTc1My4yOTE4MTEsImV4cCI6MTcyODgxMjE1My4yODg5MjEsInN1YiI6IjciLCJzY29wZXMiOltdfQ.iB7mOfoh9uFTDwoWRsEnjgToFftA7RBJmmN3AkrgBY8SRgz0Gzk1i5OKd3WEG37KJ7RGjvxUVOkoOc6wRugU7Z_lWiYsiBiEwwS3bGyQbng_8ZaruC0llBo-kfhIjvJOS-CIrpF7RtLQerLXECuYPt8Yl2lfiKExCpvLNhc7Dar65r1FFv8xajKLH0Loh73KWruahO69X3kCYpoue92Q7L5cH2HgfUGl-DyAH2uHFyF6PUqjXrrxVLCE0DTx3909hmLjNqZR70Vb47u2v5Ig1nZaPxPIEOdQhjG7_5fZe_2R6PEb6NQf-msk35_MCrGnKA0vrGQUGKtHxXKHaIUNRZ5TI1JYy5VtzCNYPsxwUQn1bh8TLJyBGLlAyGpXIrPD1rguKxP3KKxtn2RFlIFkimchrC0AnDllOUc8Li98RvzlBd054lxdgbecOndQnbwizB3OawvREI8QEUYXfF1m_UlelOSO6zCmIdx9aMQX8fgVpdDOtVpdBP71DNj2aI5GLIX0PX-lvWAnrU3KCMAzkCHMenLeRi7xSoaAzbJPQEXNmPFfnTcHFEl8ZKGKiZZWz0pnAgN9N2JEsnN8NV8H2ds871F7BF8USAGaiiLRYivvmXrh_ozEKJH_LKh_va4T1wVH0iAAY7FjXVFsoyuK9dvYRgX0rIVe0YmIXvSJSjI";
  var petBreedId = ''.obs;
  var isRegLoading = false.obs;
  registration() async {
    var mapData = {
      "name": "Dog 12",
      "pet_type": "8",
      "pet_breed": "7",
      "birth_date": "10-10-2023",
      "image": "",
      "gender": "male"
    };

    try {
      isRegLoading(true);
      var response = await http.post(
        Uri.parse(addUrl),
        body: mapData,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print("click reg");
      }
      isRegLoading(false);
    } catch (e) {
      isRegLoading(false);
      print("Error $e");
    }
  }

  addPet({
    imgPath,
    petName,
    petTypeId,
    gender,
    birthDate,
  }) async {
    print("Breed Id from page ${petBreedId}");
    print("Image path $imgPath");

    try {
      isLoading(true);

      var request = http.MultipartRequest(
        'POST',
        Uri.parse("$addUrl"),
      );

      request.headers['authorization'] = 'Bearer ' + token;
      request.headers['Content-Type'] = "application/json";
      request.headers['Accept'] = "application/json";
      print(imgPath);
      var multipartFile = await http.MultipartFile.fromPath('image', imgPath);
      request.fields.addAll({
        "name": petName,
        "pet_type": petTypeId.toString(),
        "gender": gender,
        "pet_breed": petBreedId.value.toString(),
        "birth_date": birthDate,
      });

      request.files.add(multipartFile);
      var response = await request.send();
      final res = await http.Response.fromStream(response);

      var jsonData = jsonDecode(res.body);
      print("response code ${response.statusCode}");
      if (response.statusCode == 200) {
        Get.to(HiAnik());
        Get.snackbar("Add Pet", "Successfully Done",
            colorText: Colors.black,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: lavenderColor);
      } else if (response.statusCode == 404) {
        print("error image uplaod ${response.statusCode} ");
      }

      isLoading(false);
    } catch (e) {
      isLoading(false);

      print("jjh$e");
    }
  }

  List<PetTypeModel> petTypeList = <PetTypeModel>[].obs;

  getPetType() async {
    try {
      isLoading(true);
      petTypeList.clear();
      var response = await http.get(
        Uri.parse("${url}customer/pet_management/types"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in jsonData) {
          petTypeList.add(PetTypeModel.fromJson(index));
        }

        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      print("Error $e");
    }
  }

  var petIdForBreeds = ''.obs;
  List<PetBreedModel> petBreedList = <PetBreedModel>[].obs;
  getPetBreed() async {
    print("pet bred $petIdForBreeds");
    try {
      isLoading2(true);
      petBreedList.clear();
      var response = await http.get(
        Uri.parse("${url}customer/pet_management/breeds/$petIdForBreeds"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in jsonData) {
          petBreedList.add(PetBreedModel.fromJson(index));
        }
        print("Pet Breeds list ${petBreedList.length}");
        isLoading2(false);
      }
    } catch (e) {
      isLoading2(false);
      print("Error $e");
    }
  }

  List<PetListModel> petList = <PetListModel>[].obs;

  getPetList() async {
    try {
      isLoading(true);
      petList.clear();
      var response = await http.get(
        Uri.parse("${url}customer/pet_management/"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in jsonData) {
          petList.add(PetListModel.fromJson(index));
        }

        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      print("Error $e");
    }
  }

  List<PetReminderTypesModel> reminderTypeList = <PetReminderTypesModel>[].obs;

  getPetReminderTypeList() async {
    try {
      isLoading(true);

      var response = await http.get(
        Uri.parse("${url}customer/reminder/types"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      var jsonData = jsonDecode(response.body);
      print("Reminder $jsonData");
      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in jsonData) {
          reminderTypeList.add(PetReminderTypesModel.fromJson(index));
        }

        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      print("Error $e");
    }
  }
}
