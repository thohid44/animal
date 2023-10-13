// To parse this JSON data, do
//
//     final petReminderModel = petReminderModelFromJson(jsonString);

import 'dart:convert';

List<PetReminderModel> petReminderModelFromJson(String str) => List<PetReminderModel>.from(json.decode(str).map((x) => PetReminderModel.fromJson(x)));

String petReminderModelToJson(List<PetReminderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PetReminderModel {
    int? id;
    String? name;
    String? icon;

    PetReminderModel({
        this.id,
        this.name,
        this.icon,
    });

    factory PetReminderModel.fromJson(Map<String, dynamic> json) => PetReminderModel(
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
