import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor({required this.dio});
  final Dio dio;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final currentUser = _firebaseAuth.currentUser;

      if (currentUser != null) {
        final token = await currentUser.getIdToken(true);

        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
      }

      handler.next(options);
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: 'Failed to retrieve token',
        ),
        true,
      );
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      try {
        final currentUser = _firebaseAuth.currentUser;

        if (currentUser != null) {
          final newToken = await currentUser.getIdToken(true);

          if (newToken != null) {
            err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
          }

          final response = await dio.request(
            err.requestOptions.path,
            options: Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers,
            ),
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );

          return handler.resolve(response);
        }
      } catch (e) {
        return handler.next(err);
      }
    }
    handler.next(err);
  }
}
