import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:techtonic_blog_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:techtonic_blog_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:techtonic_blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:techtonic_blog_app/features/auth/presentation/bloc/auth_bloc.dart';

import 'core/secrets/app_secrets.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecases/user_login.dart';

// to register dependencies with get it, we need an global instance of get it

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnonKey);
  serviceLocator.registerLazySingleton(() => supabase.client);
  // registerLazySingleton allows access to same instance throughout the
  // app lifecycle instead of creating new instances on demand
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserSignUp(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => UserLogin(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogin: serviceLocator(),
    ),
  );
}
