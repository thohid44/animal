// To parse this JSON data, do
//
//     final petReminderTypeModel = petReminderTypeModelFromJson(jsonString);

import 'dart:convert';

List<PetReminderTypeModel> petReminderTypeModelFromJson(String str) => List<PetReminderTypeModel>.from(json.decode(str).map((x) => PetReminderTypeModel.fromJson(x)));


class PetReminderTypeModel {
    int? id;
    String? name;
    int? userId;
    int? petType;
    int? petBreed;
    dynamic gender;
    String? birthDate;
    int? status;
    String? image;
    DateTime? createdAt;
    DateTime? updatedAt;

    PetReminderTypeModel({
        this.id,
        this.name,
        this.userId,
        this.petType,
        this.petBreed,
        this.gender,
        this.birthDate,
        this.status,
        this.image,
        this.createdAt,
        this.updatedAt,
    });

    factory PetReminderTypeModel.fromJson(Map<String, dynamic> json) => PetReminderTypeModel(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        petType: json["pet_type"],
        petBreed: json["pet_breed"],
        gender: json["gender"],
        birthDate: json["birth_date"],
        status: json["status"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

   
}
