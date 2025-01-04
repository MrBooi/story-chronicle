import 'package:chronicle/core/api/api_client.dart';
import 'package:chronicle/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:chronicle/features/auth/data/repository/auth_repository_impl.dart';
import 'package:chronicle/features/auth/domain/repository/auth_repository.dart';
import 'package:chronicle/features/auth/presentation/bloc/bloc/user_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GetIt getIt = GetIt.instance;

void setUp() {
  registerCore();
  registerApiClient();
  registerDataSource();
  registerRepository();
  registerBloc();
}

void registerCore() {
  getIt.registerSingleton(GoogleSignIn());
  getIt.registerSingleton(FirebaseAuth.instance);
}

void registerApiClient() {
  getIt.registerSingleton(ApiClient());
}

void registerDataSource() {
  final dio = getIt<ApiClient>().getDio();
  getIt.registerSingleton(AuthRemoteDataSource(dio: dio));
}

void registerRepository() {
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      authRemoteDataSource: getIt(),
      googleSignIn: getIt(),
      firebaseAuth: getIt(),
    ),
  );
}

void registerBloc() {
  getIt.registerFactory(
    () => UserBloc(authRepository: getIt()),
  );
}
