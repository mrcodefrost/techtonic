import 'package:flutter/material.dart';
import 'package:techtonic_blog_app/features/core/theme/app_palette.dart';

import '../widgets/auth_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const AuthTextField(hintText: 'Name'),
            const SizedBox(
              height: 15,
            ),
            const AuthTextField(hintText: 'Email'),
            const SizedBox(
              height: 15,
            ),
            const AuthTextField(hintText: 'Password'),
            const SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                  text: 'Don\'t have an account ? ',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppPalette.gradient2,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
