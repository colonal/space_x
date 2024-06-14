import 'package:json_annotation/json_annotation.dart';

part 'ships_model.g.dart';

@JsonSerializable()
class ShipsModel {
  @JsonKey(name: 'last_ais_update')
  final String? lastAisUpdate;

  @JsonKey(name: 'legacy_id')
  final String? legacyId;

  @JsonKey(name: 'model')
  final String? model;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'roles')
  final List<String>? roles;

  @JsonKey(name: 'imo')
  final int? imo;

  @JsonKey(name: 'mmsi')
  final int? mmsi;

  @JsonKey(name: 'abs')
  final int? abs;

  @JsonKey(name: 'class')
  final int? shipClass;

  @JsonKey(name: 'mass_kg')
  final int? massKg;

  @JsonKey(name: 'mass_lbs')
  final int? massLbs;

  @JsonKey(name: 'year_built')
  final int? yearBuilt;

  @JsonKey(name: 'home_port')
  final String? homePort;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'speed_kn')
  final int? speedKn;

  @JsonKey(name: 'course_deg')
  final int? courseDeg;

  @JsonKey(name: 'latitude')
  final double? latitude;

  @JsonKey(name: 'longitude')
  final double? longitude;

  @JsonKey(name: 'link')
  final String? link;

  @JsonKey(name: 'image')
  final String? image;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'active')
  final bool? active;

  @JsonKey(name: 'launches')
  final List<String>? launches;

  @JsonKey(name: 'id')
  final String? id;

  ShipsModel({
    required this.lastAisUpdate,
    required this.legacyId,
    required this.model,
    required this.type,
    required this.roles,
    required this.imo,
    required this.mmsi,
    required this.abs,
    required this.shipClass,
    required this.massKg,
    required this.massLbs,
    required this.yearBuilt,
    required this.homePort,
    required this.status,
    required this.speedKn,
    required this.courseDeg,
    required this.latitude,
    required this.longitude,
    required this.link,
    required this.image,
    required this.name,
    required this.active,
    required this.launches,
    required this.id,
  });

  factory ShipsModel.fromJson(Map<String, dynamic> json) =>
      _$ShipsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipsModelToJson(this);
}
