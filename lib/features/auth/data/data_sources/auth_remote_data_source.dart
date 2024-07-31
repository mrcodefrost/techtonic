import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:techtonic_blog_app/features/auth/data/models/user_model.dart';

import '../../../../core/error/exceptions.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;

  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUserData();
}

// Implementation of the interface
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> loginWithEmailPassword({required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(password: password, email: email);
      if (response.user == null) {
        throw const ServerException('User is null');
      }
      return UserModel.fromJson(response.user!.toJson()).copyWith(email: currentUserSession!.user.email);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword(
      {required String name, required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth.signUp(password: password, email: email, data: {
        'name': name,
      });

      if (response.user == null) {
        throw const ServerException('User is null');
      }
      return UserModel.fromJson(response.user!.toJson()).copyWith(email: currentUserSession!.user.email);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      // to directly access the table in supabase db
      // select parameters specify from which columns data is being pulled
      // if nothing is passed, * is the default value which pulls all columns
      // .eq will specify which row to get

      if (currentUserSession != null) {
        final userData = await supabaseClient.from('profiles').select().eq('id', currentUserSession!.user.id);
        return UserModel.fromJson(userData.first).copyWith(
          email: currentUserSession!.user.email, // since email not present int this table
        );
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
