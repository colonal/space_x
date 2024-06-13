import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_sources/launches_data_sources.dart';
import '../model/launches.dart';

class LaunchesRepositories {
  final LaunchesDataSources _dataSources;

  LaunchesRepositories({required LaunchesDataSources dataSources})
      : _dataSources = dataSources;

  Future<ApiResult<List<Launches>>> launches() async {
    try {
      final response = await _dataSources.getLaunches();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
