// To parse this JSON data, do
//
//     final petTypeModel = petTypeModelFromJson(jsonString);

import 'dart:convert';

List<PetTypeModel> petTypeModelFromJson(String str) => List<PetTypeModel>.from(json.decode(str).map((x) => PetTypeModel.fromJson(x)));


class PetTypeModel {
    int? id;
    String? name;
    String? icon;

    PetTypeModel({
        this.id,
        this.name,
        this.icon,
    });

    factory PetTypeModel.fromJson(Map<String, dynamic> json) => PetTypeModel(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
    };
}
