import 'package:json_annotation/json_annotation.dart';

part 'capsule.g.dart';

@JsonSerializable()
class Capsule {
  final String id;
  final String type;
  final String status;
  final String serial;
  final List<String> launches;
  @JsonKey(name: 'reuse_count')
  final int reuseCount;
  @JsonKey(name: 'water_landings')
  final int waterLandings;
  @JsonKey(name: 'land_landings')
  final int landLandings;
  @JsonKey(name: 'last_update')
  final String? lastUpdate;

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

  Map<String, dynamic> toJson() => _$CapsuleToJson(this);
}
