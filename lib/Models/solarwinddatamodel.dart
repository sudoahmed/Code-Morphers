// To parse this JSON data, do
//
//     final solarWindDataModel = solarWindDataModelFromJson(jsonString);

import 'dart:convert';

SolarWindDataModel solarWindDataModelFromJson(String str) =>
    SolarWindDataModel.fromJson(json.decode(str));

String solarWindDataModelToJson(SolarWindDataModel data) =>
    json.encode(data.toJson());

class SolarWindDataModel {
  SolarWindDataModel({
    required this.message,
    required this.data,
  });

  String message;
  List<SolarWindData> data;

  factory SolarWindDataModel.fromJson(Map<String, dynamic> json) =>
      SolarWindDataModel(
        message: json["message"],
        data: List<SolarWindData>.from(
            json["data"].map((x) => SolarWindData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SolarWindData {
  SolarWindData({
    required this.timeTag,
    required this.density,
    required this.speed,
    required this.temperature,
  });

  DateTime timeTag;
  String? density;
  String? speed;
  String? temperature;

  factory SolarWindData.fromJson(Map<String, dynamic> json) => SolarWindData(
        timeTag: DateTime.parse(json["time_tag"]),
        density: json["density"] == null ? null : json["density"],
        speed: json["speed"] == null ? null : json["speed"],
        temperature: json["temperature"] == null ? null : json["temperature"],
      );

  Map<String, dynamic> toJson() => {
        "time_tag": timeTag.toIso8601String(),
        "density": density == null ? null : density,
        "speed": speed == null ? null : speed,
        "temperature": temperature == null ? null : temperature,
      };
}
