import 'package:chronicle/features/auth/domain/model/user_model.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource({required this.dio});

  final Dio dio;

  Future<UserModel> loginWithGoogle(String token) async {
    final request = await dio.post('users/login', data: {'token': token});

    return UserModel.fromJson(request.data as Map<String, dynamic>);
  }
}
