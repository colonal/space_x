import 'package:json_annotation/json_annotation.dart';

part 'launches.g.dart';

@JsonSerializable(explicitToJson: true)
class Launches {
  final Fairings? fairings;
  final Links? links;
  @JsonKey(name: 'static_fire_date_utc')
  final String? staticFireDateUtc;
  @JsonKey(name: 'static_fire_date_unix')
  final int? staticFireDateUnix;
  final bool? net;
  final int? window;
  final String? rocket;
  final bool? success;
  final List<Failure?>? failures;
  final String? details;
  final List<dynamic>? crew;
  final List<dynamic>? ships;
  final List<dynamic>? capsules;
  final List<String>? payloads;
  final String? launchpad;
  @JsonKey(name: 'flight_number')
  final int? flightNumber;
  final String? name;
  @JsonKey(name: 'date_utc')
  final String? dateUtc;
  @JsonKey(name: 'date_unix')
  final int? dateUnix;
  @JsonKey(name: 'date_local')
  final String? dateLocal;
  @JsonKey(name: 'date_precision')
  final String? datePrecision;
  final bool? upcoming;
  final List<Core?>? cores;
  @JsonKey(name: 'auto_update')
  final bool? autoUpdate;
  final bool? tbd;
  @JsonKey(name: 'launch_library_id')
  final String? launchLibraryId;
  final String id;

  Launches({
    required this.fairings,
    required this.links,
    required this.staticFireDateUtc,
    required this.staticFireDateUnix,
    required this.net,
    required this.window,
    required this.rocket,
    required this.success,
    required this.failures,
    required this.details,
    required this.crew,
    required this.ships,
    required this.capsules,
    required this.payloads,
    required this.launchpad,
    required this.flightNumber,
    required this.name,
    required this.dateUtc,
    required this.dateUnix,
    required this.dateLocal,
    required this.datePrecision,
    required this.upcoming,
    required this.cores,
    required this.autoUpdate,
    required this.tbd,
    required this.launchLibraryId,
    required this.id,
  });

  factory Launches.fromJson(Map<String, dynamic> json) =>
      _$LaunchesFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchesToJson(this);
}

@JsonSerializable()
class Fairings {
  final bool? reused;
  @JsonKey(name: 'recovery_attempt')
  final bool? recoveryAttempt;
  final bool? recovered;
  final List<dynamic>? ships;

  Fairings({
    required this.reused,
    required this.recoveryAttempt,
    required this.recovered,
    required this.ships,
  });

  factory Fairings.fromJson(Map<String, dynamic> json) =>
      _$FairingsFromJson(json);

  Map<String, dynamic> toJson() => _$FairingsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Links {
  final Patch? patch;
  final Flickr? flickr;
  @JsonKey(name: 'presskit')
  final String? pressKit;
  final String? webcast;
  @JsonKey(name: 'youtube_id')
  final String? youtubeId;
  final String? article;
  final String? wikipedia;

  Links({
    required this.patch,
    required this.flickr,
    required this.pressKit,
    required this.webcast,
    required this.youtubeId,
    required this.article,
    required this.wikipedia,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Patch {
  final String? small;
  final String? large;

  Patch({
    required this.small,
    required this.large,
  });

  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);

  Map<String, dynamic> toJson() => _$PatchToJson(this);
}

@JsonSerializable()
class Flickr {
  final List<dynamic>? small;
  final List<dynamic>? original;

  Flickr({
    required this.small,
    required this.original,
  });

  factory Flickr.fromJson(Map<String, dynamic> json) => _$FlickrFromJson(json);

  Map<String, dynamic> toJson() => _$FlickrToJson(this);
}

@JsonSerializable()
class Failure {
  final int? time;
  final int? altitude;
  final String? reason;

  Failure({
    required this.time,
    required this.altitude,
    required this.reason,
  });

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);

  Map<String, dynamic> toJson() => _$FailureToJson(this);
}

@JsonSerializable()
class Core {
  final String? core;
  final int? flight;
  final bool? gridfins;
  final bool? legs;
  final bool? reused;
  @JsonKey(name: 'landing_attempt')
  final bool? landingAttempt;
  @JsonKey(name: 'landing_success')
  final bool? landingSuccess;
  @JsonKey(name: 'landing_type')
  final String? landingType;
  final String? landpad;

  Core({
    required this.core,
    required this.flight,
    required this.gridfins,
    required this.legs,
    required this.reused,
    required this.landingAttempt,
    required this.landingSuccess,
    required this.landingType,
    required this.landpad,
  });

  factory Core.fromJson(Map<String, dynamic> json) => _$CoreFromJson(json);

  Map<String, dynamic> toJson() => _$CoreToJson(this);
}
