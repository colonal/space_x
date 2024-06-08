// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinksModel _$LinksModelFromJson(Map<String, dynamic> json) => LinksModel(
      website: json['website'] as String,
      flickr: json['flickr'] as String,
      twitter: json['twitter'] as String,
      elonTwitter: json['elon_twitter'] as String,
    );

Map<String, dynamic> _$LinksModelToJson(LinksModel instance) =>
    <String, dynamic>{
      'website': instance.website,
      'flickr': instance.flickr,
      'twitter': instance.twitter,
      'elon_twitter': instance.elonTwitter,
    };
