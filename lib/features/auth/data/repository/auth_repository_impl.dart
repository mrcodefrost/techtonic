import 'package:fpdart/fpdart.dart';
import 'package:techtonic_blog_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:techtonic_blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:techtonic_blog_app/features/core/error/exceptions.dart';
import 'package:techtonic_blog_app/features/core/error/failures.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword({required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      {required String name, required String email, required String password}) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailPassword(name: name, email: email, password: password);

      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
