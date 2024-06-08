import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/api_constants.dart';
import '../model/company_model.dart';

part 'company_data_sources.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CompanyRemoteDataSources {
  factory CompanyRemoteDataSources(Dio dio, {String baseUrl}) =
      _CompanyRemoteDataSources;

  @GET(ApiConstants.company)
  Future<CompanyModel> company();
}
