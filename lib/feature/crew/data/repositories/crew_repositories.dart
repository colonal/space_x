import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_sources/crew_data_sources.dart';
import '../model/crew_model.dart';

class CrewRepositories {
  final CrewRemoteDataSources _crewRemoteDataSources;

  CrewRepositories({required CrewRemoteDataSources crewRemoteDataSources})
      : _crewRemoteDataSources = crewRemoteDataSources;

  Future<ApiResult<List<CrewModel>>> crew() async {
    try {
      final response = await _crewRemoteDataSources.crew();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
