// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capsule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Capsule _$CapsuleFromJson(Map<String, dynamic> json) => Capsule(
      reuseCount: (json['reuse_count'] as num).toInt(),
      waterLandings: (json['water_landings'] as num).toInt(),
      landLandings: (json['land_landings'] as num).toInt(),
      lastUpdate: json['last_update'] as String?,
      launches:
          (json['launches'] as List<dynamic>).map((e) => e as String).toList(),
      serial: json['serial'] as String,
      status: json['status'] as String,
      type: json['type'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$CapsuleToJson(Capsule instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'status': instance.status,
      'serial': instance.serial,
      'launches': instance.launches,
      'reuse_count': instance.reuseCount,
      'water_landings': instance.waterLandings,
      'land_landings': instance.landLandings,
      'last_update': instance.lastUpdate,
    };
