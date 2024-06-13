// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launches _$LaunchesFromJson(Map<String, dynamic> json) => Launches(
      fairings: json['fairings'] == null
          ? null
          : Fairings.fromJson(json['fairings'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      staticFireDateUtc: json['static_fire_date_utc'] as String?,
      staticFireDateUnix: (json['static_fire_date_unix'] as num?)?.toInt(),
      net: json['net'] as bool?,
      window: (json['window'] as num?)?.toInt(),
      rocket: json['rocket'] as String?,
      success: json['success'] as bool?,
      failures: (json['failures'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
      details: json['details'] as String?,
      crew: json['crew'] as List<dynamic>?,
      ships: json['ships'] as List<dynamic>?,
      capsules: json['capsules'] as List<dynamic>?,
      payloads: (json['payloads'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      launchpad: json['launchpad'] as String?,
      flightNumber: (json['flight_number'] as num?)?.toInt(),
      name: json['name'] as String?,
      dateUtc: json['date_utc'] as String?,
      dateUnix: (json['date_unix'] as num?)?.toInt(),
      dateLocal: json['date_local'] as String?,
      datePrecision: json['date_precision'] as String?,
      upcoming: json['upcoming'] as bool?,
      cores: (json['cores'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Core.fromJson(e as Map<String, dynamic>))
          .toList(),
      autoUpdate: json['auto_update'] as bool?,
      tbd: json['tbd'] as bool?,
      launchLibraryId: json['launch_library_id'] as String?,
      id: json['id'] as String,
    );

Map<String, dynamic> _$LaunchesToJson(Launches instance) => <String, dynamic>{
      'fairings': instance.fairings?.toJson(),
      'links': instance.links?.toJson(),
      'static_fire_date_utc': instance.staticFireDateUtc,
      'static_fire_date_unix': instance.staticFireDateUnix,
      'net': instance.net,
      'window': instance.window,
      'rocket': instance.rocket,
      'success': instance.success,
      'failures': instance.failures?.map((e) => e?.toJson()).toList(),
      'details': instance.details,
      'crew': instance.crew,
      'ships': instance.ships,
      'capsules': instance.capsules,
      'payloads': instance.payloads,
      'launchpad': instance.launchpad,
      'flight_number': instance.flightNumber,
      'name': instance.name,
      'date_utc': instance.dateUtc,
      'date_unix': instance.dateUnix,
      'date_local': instance.dateLocal,
      'date_precision': instance.datePrecision,
      'upcoming': instance.upcoming,
      'cores': instance.cores?.map((e) => e?.toJson()).toList(),
      'auto_update': instance.autoUpdate,
      'tbd': instance.tbd,
      'launch_library_id': instance.launchLibraryId,
      'id': instance.id,
    };

Fairings _$FairingsFromJson(Map<String, dynamic> json) => Fairings(
      reused: json['reused'] as bool?,
      recoveryAttempt: json['recovery_attempt'] as bool?,
      recovered: json['recovered'] as bool?,
      ships: json['ships'] as List<dynamic>?,
    );

Map<String, dynamic> _$FairingsToJson(Fairings instance) => <String, dynamic>{
      'reused': instance.reused,
      'recovery_attempt': instance.recoveryAttempt,
      'recovered': instance.recovered,
      'ships': instance.ships,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      patch: json['patch'] == null
          ? null
          : Patch.fromJson(json['patch'] as Map<String, dynamic>),
      flickr: json['flickr'] == null
          ? null
          : Flickr.fromJson(json['flickr'] as Map<String, dynamic>),
      pressKit: json['presskit'] as String?,
      webcast: json['webcast'] as String?,
      youtubeId: json['youtube_id'] as String?,
      article: json['article'] as String?,
      wikipedia: json['wikipedia'] as String?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'patch': instance.patch?.toJson(),
      'flickr': instance.flickr?.toJson(),
      'presskit': instance.pressKit,
      'webcast': instance.webcast,
      'youtube_id': instance.youtubeId,
      'article': instance.article,
      'wikipedia': instance.wikipedia,
    };

Patch _$PatchFromJson(Map<String, dynamic> json) => Patch(
      small: json['small'] as String?,
      large: json['large'] as String?,
    );

Map<String, dynamic> _$PatchToJson(Patch instance) => <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
    };

Flickr _$FlickrFromJson(Map<String, dynamic> json) => Flickr(
      small: json['small'] as List<dynamic>?,
      original: json['original'] as List<dynamic>?,
    );

Map<String, dynamic> _$FlickrToJson(Flickr instance) => <String, dynamic>{
      'small': instance.small,
      'original': instance.original,
    };

Failure _$FailureFromJson(Map<String, dynamic> json) => Failure(
      time: (json['time'] as num?)?.toInt(),
      altitude: (json['altitude'] as num?)?.toInt(),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$FailureToJson(Failure instance) => <String, dynamic>{
      'time': instance.time,
      'altitude': instance.altitude,
      'reason': instance.reason,
    };

Core _$CoreFromJson(Map<String, dynamic> json) => Core(
      core: json['core'] as String?,
      flight: (json['flight'] as num?)?.toInt(),
      gridfins: json['gridfins'] as bool?,
      legs: json['legs'] as bool?,
      reused: json['reused'] as bool?,
      landingAttempt: json['landing_attempt'] as bool?,
      landingSuccess: json['landing_success'] as bool?,
      landingType: json['landing_type'] as String?,
      landpad: json['landpad'] as String?,
    );

Map<String, dynamic> _$CoreToJson(Core instance) => <String, dynamic>{
      'core': instance.core,
      'flight': instance.flight,
      'gridfins': instance.gridfins,
      'legs': instance.legs,
      'reused': instance.reused,
      'landing_attempt': instance.landingAttempt,
      'landing_success': instance.landingSuccess,
      'landing_type': instance.landingType,
      'landpad': instance.landpad,
    };
