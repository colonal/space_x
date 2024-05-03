import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/api_constants.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio(BaseOptions(
        baseUrl: ApiConstants.apiBaseUrl,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
      ));

      if (!kReleaseMode) {
        dio!.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ));
      }
      return dio!;
    } else {
      return dio!;
    }
  }
}
