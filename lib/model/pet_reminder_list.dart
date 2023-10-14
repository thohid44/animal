// To parse this JSON data, do
//
//     final reminderList = reminderListFromJson(jsonString);

import 'dart:convert';

List<ReminderList> reminderListFromJson(String str) => List<ReminderList>.from(json.decode(str).map((x) => ReminderList.fromJson(x)));



class ReminderList {
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
    List<dynamic>? reminders;

    ReminderList({
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
        this.reminders,
    });

    factory ReminderList.fromJson(Map<String, dynamic> json) => ReminderList(
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
        reminders: List<dynamic>.from(json["reminders"].map((x) => x)),
    );

    
}
