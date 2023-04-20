import 'package:json_annotation/json_annotation.dart';

part 'clouds_model.g.dart';

//more info https://openweathermap.org/forecast5#5days
@JsonSerializable()
class CloudsModel {
  final int? all;

  CloudsModel({this.all,});

  factory CloudsModel.fromJson(Map<String, dynamic> json) => _$CloudsModelFromJson(json);
}