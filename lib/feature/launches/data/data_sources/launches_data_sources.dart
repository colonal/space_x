import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/api_constants.dart';
import '../model/launches.dart';
part 'launches_data_sources.g.dart';

@RestApi()
abstract class LaunchesDataSources {
  factory LaunchesDataSources(Dio dio, {String baseUrl}) = _LaunchesDataSources;

  @GET(ApiConstants.launches)
  Future<List<Launches>> getLaunches();
}
