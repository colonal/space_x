import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_sources/home_data_sources.dart';
import '../model/rockets_response.dart';

class HomeRepositories {
  final HomeRemoteDataSources _homeRemoteDataSources;

  HomeRepositories({required HomeRemoteDataSources homeRemoteDataSources})
      : _homeRemoteDataSources = homeRemoteDataSources;

  Future<ApiResult<List<RocketsResponse>>> rockets() async {
    try {
      final response = await _homeRemoteDataSources.rockets();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
