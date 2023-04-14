// To parse this JSON data, do
//
//     final predictObjectResponseModel = predictObjectResponseModelFromJson(jsonString);

import 'dart:convert';

PredictObjectResponseModel predictObjectResponseModelFromJson(String str) =>
    PredictObjectResponseModel.fromJson(json.decode(str));

String predictObjectResponseModelToJson(PredictObjectResponseModel data) =>
    json.encode(data.toJson());

class PredictObjectResponseModel {
  PredictObjectResponseModel({
    this.data,
    this.msg,
    this.status,
  });

  Data? data;
  String? msg;
  String? status;

  factory PredictObjectResponseModel.fromJson(Map<String, dynamic> json) =>
      PredictObjectResponseModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "msg": msg,
        "status": status,
      };
}

class Data {
  Data({
    this.foodName,
    this.calcium,
    this.calories,
    this.carbohydrates,
    this.cholesterol,
    this.fat,
    this.fiber,
    this.iron,
    this.packageWeight,
    this.protein,
    this.saturatedFat,
    this.servingSize,
    this.servingSizeUnit,
    this.sodium,
    this.sugars,
    this.transFat,
  });

  String? foodName;
  Value? calcium;
  Value? calories;
  Value? carbohydrates;
  Value? cholesterol;
  Value? fat;
  Value? fiber;
  Value? iron;
  String? packageWeight;
  Value? protein;
  Value? saturatedFat;
  double? servingSize;
  String? servingSizeUnit;
  Value? sodium;
  Value? sugars;
  Value? transFat;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        foodName: json["FoodName"],
        calcium:
            json["calcium"] == null ? null : Value.fromJson(json["calcium"]),
        calories:
            json["calories"] == null ? null : Value.fromJson(json["calories"]),
        carbohydrates: json["carbohydrates"] == null
            ? null
            : Value.fromJson(json["carbohydrates"]),
        cholesterol: json["cholesterol"] == null
            ? null
            : Value.fromJson(json["cholesterol"]),
        fat: json["fat"] == null ? null : Value.fromJson(json["fat"]),
        fiber: json["fiber"] == null ? null : Value.fromJson(json["fiber"]),
        iron: json["iron"] == null ? null : Value.fromJson(json["iron"]),
        packageWeight: json["packageWeight"],
        protein:
            json["protein"] == null ? null : Value.fromJson(json["protein"]),
        saturatedFat: json["saturatedFat"] == null
            ? null
            : Value.fromJson(json["saturatedFat"]),
        servingSize: json["servingSize"] == "N/A" ? 0 : json["servingSize"],
        servingSizeUnit:
            json["servingSizeUnit"] == "N/A" ? null : json["servingSizeUnit"],
        sodium: json["sodium"] == null ? null : Value.fromJson(json["sodium"]),
        sugars: json["sugars"] == null ? null : Value.fromJson(json["sugars"]),
        transFat:
            json["transFat"] == null ? null : Value.fromJson(json["transFat"]),
      );

  Map<String, dynamic> toJson() => {
        "FoodName": foodName,
        "calcium": calcium?.toJson(),
        "calories": calories?.toJson(),
        "carbohydrates": carbohydrates?.toJson(),
        "cholesterol": cholesterol?.toJson(),
        "fat": fat?.toJson(),
        "fiber": fiber?.toJson(),
        "iron": iron?.toJson(),
        "packageWeight": packageWeight,
        "protein": protein?.toJson(),
        "saturatedFat": saturatedFat?.toJson(),
        "servingSize": servingSize,
        "servingSizeUnit": servingSizeUnit,
        "sodium": sodium?.toJson(),
        "sugars": sugars?.toJson(),
        "transFat": transFat?.toJson(),
      };
}

class Value {
  Value({
    this.value,
  });

  double? value;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}
