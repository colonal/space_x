import 'package:space_x/core/networking/api_error_handler.dart';
import 'package:space_x/core/networking/api_result.dart';
import 'package:space_x/feature/capsules/data/model/capsule.dart';
import 'package:space_x/feature/home/data/data_sources/home_data_sources.dart';

class CapsulesRepo {
  const CapsulesRepo({required HomeRemoteDataSources homeRemoteDataSources})
      : _homeRemoteDataSources = homeRemoteDataSources;

  final HomeRemoteDataSources _homeRemoteDataSources;

  Future<ApiResult<List<Capsule>>> fetchCapsules() async {
    try {
      final capsules = await _homeRemoteDataSources.fetchCapsules();

      return ApiResult.success(capsules);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
