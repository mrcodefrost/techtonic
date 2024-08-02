import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techtonic_blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:techtonic_blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:techtonic_blog_app/features/auth/presentation/screens/login_screen.dart';
import 'package:techtonic_blog_app/features/blog/presentation/pages/blog_screen.dart';
import 'package:techtonic_blog_app/init_dependencies.dart';

import 'core/theme/theme.dart';
import 'features/blog/presentation/bloc/blog_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // already present in runApp but since we calling it before
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
        BlocProvider(create: (_) => serviceLocator<BlogBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      debugShowCheckedModeBanner: false,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(selector: (state) {
        return state is AppUserLoggedIn;
      }, builder: (context, isLoggedIn) {
        if (isLoggedIn) {
          return const BlogScreen();
        }
        return const LoginScreen();
      }),
    );
  }
}
