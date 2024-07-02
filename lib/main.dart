import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:techtonic_blog_app/features/auth/presentation/screens/login_screen.dart';
import 'package:techtonic_blog_app/features/core/secrets/app_secrets.dart';

import 'features/auth/presentation/screens/signup_screen.dart';
import 'features/core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // already present in runApp but since we calling it before
  final supabase = await Supabase.initialize(url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnonKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
