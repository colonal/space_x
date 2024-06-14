import 'package:space_x/core/networking/api_error_handler.dart';

import '../../../../core/networking/api_result.dart';
import '../data_sources/company_data_sources.dart';
import '../model/company_model.dart';

class CompanyRepository {
  final CompanyRemoteDataSources _dataSources;
  const CompanyRepository({required CompanyRemoteDataSources dataSources})
      : _dataSources = dataSources;

  Future<ApiResult<CompanyModel>> company() async {
    try {
      final response = await _dataSources.company();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
