import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:techtonic_blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:techtonic_blog_app/core/network/connection_checker.dart';
import 'package:techtonic_blog_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:techtonic_blog_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:techtonic_blog_app/features/auth/domain/usecases/current_user.dart';
import 'package:techtonic_blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:techtonic_blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:techtonic_blog_app/features/blog/data/datasources/blog_local_data_source.dart';
import 'package:techtonic_blog_app/features/blog/domain/usecase/upload_blog.dart';

import 'core/secrets/app_secrets.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecases/user_login.dart';
import 'features/blog/data/datasources/blog_remote_data_source.dart';
import 'features/blog/data/repositories/blog_repository_impl.dart';
import 'features/blog/domain/repositories/blog_repository.dart';
import 'features/blog/domain/usecase/get_all_blogs.dart';
import 'features/blog/presentation/bloc/blog_bloc.dart';

part 'init_dependencies.main.dart';
// file to store imports for init_dependencies.main.dart
