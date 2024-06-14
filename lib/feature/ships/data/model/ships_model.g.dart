// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ships_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipsModel _$ShipsModelFromJson(Map<String, dynamic> json) => ShipsModel(
      lastAisUpdate: json['last_ais_update'] as String?,
      legacyId: json['legacy_id'] as String?,
      model: json['model'] as String?,
      type: json['type'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      imo: (json['imo'] as num?)?.toInt(),
      mmsi: (json['mmsi'] as num?)?.toInt(),
      abs: (json['abs'] as num?)?.toInt(),
      shipClass: (json['class'] as num?)?.toInt(),
      massKg: (json['mass_kg'] as num?)?.toInt(),
      massLbs: (json['mass_lbs'] as num?)?.toInt(),
      yearBuilt: (json['year_built'] as num?)?.toInt(),
      homePort: json['home_port'] as String?,
      status: json['status'] as String?,
      speedKn: (json['speed_kn'] as num?)?.toInt(),
      courseDeg: (json['course_deg'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      link: json['link'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      active: json['active'] as bool?,
      launches: (json['launches'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ShipsModelToJson(ShipsModel instance) =>
    <String, dynamic>{
      'last_ais_update': instance.lastAisUpdate,
      'legacy_id': instance.legacyId,
      'model': instance.model,
      'type': instance.type,
      'roles': instance.roles,
      'imo': instance.imo,
      'mmsi': instance.mmsi,
      'abs': instance.abs,
      'class': instance.shipClass,
      'mass_kg': instance.massKg,
      'mass_lbs': instance.massLbs,
      'year_built': instance.yearBuilt,
      'home_port': instance.homePort,
      'status': instance.status,
      'speed_kn': instance.speedKn,
      'course_deg': instance.courseDeg,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'link': instance.link,
      'image': instance.image,
      'name': instance.name,
      'active': instance.active,
      'launches': instance.launches,
      'id': instance.id,
    };
