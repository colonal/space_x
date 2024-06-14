// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headquarters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeadquartersModel _$HeadquartersModelFromJson(Map<String, dynamic> json) =>
    HeadquartersModel(
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$HeadquartersModelToJson(HeadquartersModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
    };
