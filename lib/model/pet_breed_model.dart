// To parse this JSON data, do
//
//     final petBreedModel = petBreedModelFromJson(jsonString);

import 'dart:convert';

List<PetBreedModel> petBreedModelFromJson(String str) => List<PetBreedModel>.from(json.decode(str).map((x) => PetBreedModel.fromJson(x)));


class PetBreedModel {
    int? id;
    String? name;
    List<dynamic>? translations;

    PetBreedModel({
        this.id,
        this.name,
        this.translations,
    });

    factory PetBreedModel.fromJson(Map<String, dynamic> json) => PetBreedModel(
        id: json["id"],
        name: json["name"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
    );

   
}
