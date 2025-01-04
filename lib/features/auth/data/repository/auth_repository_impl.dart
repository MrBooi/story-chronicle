import 'package:chronicle/core/failure/failure.dart';
import 'package:chronicle/core/model/either.dart';
import 'package:chronicle/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:chronicle/features/auth/domain/model/user_model.dart';
import 'package:chronicle/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.googleSignIn,
    required this.firebaseAuth,
  });

  final AuthRemoteDataSource authRemoteDataSource;
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;
  @override
  Future<Either<Failure, UserModel>> loginWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final firebaseCredentials = await firebaseAuth.signInWithCredential(
        credential,
      );

      final firebaseToken = await firebaseCredentials.user?.getIdToken();

      final response = await authRemoteDataSource.loginWithGoogle(
        firebaseToken!,
      );

      return Either.right(response);
    } on DioException catch (e) {
      return Either.left(
        AuthFailure(message: e.response?.data['error'] as String),
      );
    } on Exception catch (_) {
      return Either.left(AuthFailure(message: 'Auth failure'));
    }
  }
}
