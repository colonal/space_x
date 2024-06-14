import 'package:json_annotation/json_annotation.dart';

import 'headquarters_model.dart';
import 'links_model.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  @JsonKey(name: "headquarters")
  final HeadquartersModel headquarters;
  @JsonKey(name: "links")
  final LinksModel links;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "founder")
  final String founder;
  @JsonKey(name: "founded")
  final int founded;
  @JsonKey(name: "employees")
  final int employees;
  @JsonKey(name: "vehicles")
  final int vehicles;
  @JsonKey(name: "launch_sites")
  final int launchSites;
  @JsonKey(name: "test_sites")
  final int testSites;
  @JsonKey(name: "ceo")
  final String ceo;
  @JsonKey(name: "cto")
  final String cto;
  @JsonKey(name: "coo")
  final String coo;
  @JsonKey(name: "cto_propulsion")
  final String ctoPropulsion;
  @JsonKey(name: "valuation")
  final int valuation;
  @JsonKey(name: "summary")
  final String summary;
  @JsonKey(name: "id")
  final String id;

  CompanyModel({
    required this.headquarters,
    required this.links,
    required this.name,
    required this.founder,
    required this.founded,
    required this.employees,
    required this.vehicles,
    required this.launchSites,
    required this.testSites,
    required this.ceo,
    required this.cto,
    required this.coo,
    required this.ctoPropulsion,
    required this.valuation,
    required this.summary,
    required this.id,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
