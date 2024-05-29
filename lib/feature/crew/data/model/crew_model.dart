import 'package:json_annotation/json_annotation.dart';

part 'crew_model.g.dart';

@JsonSerializable()
class CrewModel {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "agency")
  final String agency;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "wikipedia")
  final String wikipedia;
  @JsonKey(name: "launches")
  final List<String> launches;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "id")
  final String id;

  CrewModel({
    required this.name,
    required this.agency,
    required this.image,
    required this.wikipedia,
    required this.launches,
    required this.status,
    required this.id,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) =>
      _$CrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrewModelToJson(this);
}
