// To parse this JSON data, do
//
//     final petListModel = petListModelFromJson(jsonString);

import 'dart:convert';

List<PetListModel> petListModelFromJson(String str) => List<PetListModel>.from(json.decode(str).map((x) => PetListModel.fromJson(x)));



class PetListModel {
    int? id;
    String? name;
    int? userId;
    int? petType;
    int? petBreed;
    dynamic gender;
    String? birthDate;
    int? status;
    String? image;
  

    PetListModel({
        this.id,
        this.name,
        this.userId,
        this.petType,
        this.petBreed,
        this.gender,
        this.birthDate,
        this.status,
        this.image,
    
    });

    factory PetListModel.fromJson(Map<String, dynamic> json) => PetListModel(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        petType: json["pet_type"],
        petBreed: json["pet_breed"],
        gender: json["gender"],
        birthDate: json["birth_date"],
        status: json["status"],
        image: json["image"],
      
    );

   
}
