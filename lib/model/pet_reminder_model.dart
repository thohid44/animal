// To parse this JSON data, do
//
//     final petReminderModel = petReminderModelFromJson(jsonString);

import 'dart:convert';

List<PetReminderTypesModel> petReminderModelFromJson(String str) => List<PetReminderTypesModel>.from(json.decode(str).map((x) => PetReminderTypesModel.fromJson(x)));

String petReminderModelToJson(List<PetReminderTypesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PetReminderTypesModel {
    int? id;
    String? name;
    String? icon;

    PetReminderTypesModel({
        this.id,
        this.name,
        this.icon,
    });

    factory PetReminderTypesModel.fromJson(Map<String, dynamic> json) => PetReminderTypesModel(
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
