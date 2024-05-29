import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/api_constants.dart';
import '../model/crew_model.dart';

part 'crew_data_sources.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CrewRemoteDataSources {
  factory CrewRemoteDataSources(Dio dio, {String baseUrl}) =
      _CrewRemoteDataSources;

  @GET(ApiConstants.crew)
  Future<List<CrewModel>> crew();
}
