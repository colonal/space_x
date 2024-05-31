import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/api_constants.dart';
import '../model/ships_model.dart';

part 'ships_data_sources.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ShipsRemoteDataSources {
  factory ShipsRemoteDataSources(Dio dio, {String baseUrl}) =
      _ShipsRemoteDataSources;

  @GET(ApiConstants.ships)
  Future<List<ShipsModel>> ships();
}
