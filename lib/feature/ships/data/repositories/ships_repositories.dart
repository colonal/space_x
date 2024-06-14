import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_sources/ships_data_sources.dart';
import '../model/ships_model.dart';

class ShipsRepositories {
  final ShipsRemoteDataSources _shipsRemoteDataSources;

  ShipsRepositories({required ShipsRemoteDataSources shipsRemoteDataSources})
      : _shipsRemoteDataSources = shipsRemoteDataSources;

  Future<ApiResult<List<ShipsModel>>> crew() async {
    try {
      final response = await _shipsRemoteDataSources.ships();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
