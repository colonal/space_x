import 'package:dio/dio.dart';
import 'package:space_x/feature/capsules/data/model/capsule.dart';

import '../../../../core/constants/api_constants.dart';
import 'package:retrofit/http.dart';

import '../model/rockets_response.dart';

part 'home_data_sources.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeRemoteDataSources {
  factory HomeRemoteDataSources(Dio dio, {String baseUrl}) =
      _HomeRemoteDataSources;

  @GET(ApiConstants.rockets)
  Future<List<RocketsResponse>> rockets();

 @GET(ApiConstants.capsulesEndPoint)
  Future<List<Capsule>> fetchCapsules();

}
