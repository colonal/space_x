import 'package:json_annotation/json_annotation.dart';

part 'links_model.g.dart';

@JsonSerializable()
class LinksModel {
  @JsonKey(name: "website")
  final String website;
  @JsonKey(name: "flickr")
  final String flickr;
  @JsonKey(name: "twitter")
  final String twitter;
  @JsonKey(name: "elon_twitter")
  final String elonTwitter;

  LinksModel({
    required this.website,
    required this.flickr,
    required this.twitter,
    required this.elonTwitter,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) =>
      _$LinksModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinksModelToJson(this);
}
