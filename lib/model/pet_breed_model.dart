// To parse this JSON data, do
//
//     final petBreedModel = petBreedModelFromJson(jsonString);

import 'dart:convert';

List<PetBreedModel> petBreedModelFromJson(String str) => List<PetBreedModel>.from(json.decode(str).map((x) => PetBreedModel.fromJson(x)));


class PetBreedModel {
    int? id;
    String? name;
   

    PetBreedModel({
        this.id,
        this.name,
      
    });

    factory PetBreedModel.fromJson(Map<String, dynamic> json) => PetBreedModel(
        id: json["id"],
        name: json["name"],
      
    );

   
}
