import 'package:json_annotation/json_annotation.dart';

part "headquarters_model.g.dart";

@JsonSerializable()
class HeadquartersModel {
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "city")
  final String city;
  @JsonKey(name: "state")
  final String state;

  HeadquartersModel({
    required this.address,
    required this.city,
    required this.state,
  });

  factory HeadquartersModel.fromJson(Map<String, dynamic> json) =>
      _$HeadquartersModelFromJson(json);

  Map<String, dynamic> toJson() => _$HeadquartersModelToJson(this);
}
