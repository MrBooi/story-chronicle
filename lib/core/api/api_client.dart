import 'package:chronicle/core/api/api_config.dart';
import 'package:chronicle/core/api/interceptors/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  Dio getDio({bool tokenInterceptor = false}) {
    final dio = Dio();
    dio.options.baseUrl = ApiConfig.BASE_URL_FOR_DIO;

    if (tokenInterceptor) {
      dio.interceptors.add(TokenInterceptor(dio: dio));
    }
    dio.interceptors.add(
      PrettyDioLogger(
        responseHeader: true,
        requestHeader: true,
        requestBody: true,
        compact: false,
      ),
    );

    return dio;
  }
}
