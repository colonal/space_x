import 'package:json_annotation/json_annotation.dart';

part 'capsule.g.dart';

@JsonSerializable()
class Capsule {
  const Capsule({
    required this.reuseCount,
    required this.waterLandings,
    required this.landLandings,
    required this.lastUpdate,
    required this.launches,
    required this.serial,
    required this.status,
    required this.type,
    required this.id,
  });

  factory Capsule.fromJson(Map<String, dynamic> json) =>
      _$CapsuleFromJson(json);

  final String id;
  @JsonKey(name: 'land_landings')
  final int landLandings;

  @JsonKey(name: 'last_update')
  final String? lastUpdate;

  final List<String> launches;
  @JsonKey(name: 'reuse_count')
  final int reuseCount;

  final String serial;
  final String status;
  final String type;
  @JsonKey(name: 'water_landings')
  final int waterLandings;

  Map<String, dynamic> toJson() => _$CapsuleToJson(this);
}
