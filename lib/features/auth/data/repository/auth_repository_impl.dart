import 'package:fpdart/fpdart.dart';
import 'package:techtonic_blog_app/core/network/connection_checker.dart';
import 'package:techtonic_blog_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:techtonic_blog_app/features/auth/data/models/user_model.dart';
import 'package:techtonic_blog_app/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/common/entities/user.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final ConnectionChecker connectionChecker;
  const AuthRepositoryImpl(this.remoteDataSource, this.connectionChecker);

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      if (!await connectionChecker.isConnected) {
        final session = remoteDataSource.currentUserSession;
        if (session == null) {
          return left(Failure('User is not logged in'));
        }
        return right(
          UserModel(id: session.user.id, email: session.user.email ?? '', name: ''),
        );
      }
      final user = await remoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failure('User not logged in !'));
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithEmailPassword({required String email, required String password}) async {
    return _getUser(() async => await remoteDataSource.loginWithEmailPassword(email: email, password: password));
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword(
      {required String name, required String email, required String password}) async {
    return _getUser(
        () async => await remoteDataSource.signUpWithEmailPassword(name: name, email: email, password: password));
  }

  // wrapper function to handle same try catch logic required by both login and signup functions
  Future<Either<Failure, User>> _getUser(
    Future<User> Function() fn,
  ) async {
    try {
      if (!await connectionChecker.isConnected) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }
      final user = await fn();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
