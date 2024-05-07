import 'package:flutter/material.dart';

import 'features/auth/presentation/screens/signup_screen.dart';
import 'features/core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: const SignUpScreen(),
    );
  }
}
