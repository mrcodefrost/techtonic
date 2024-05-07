import 'package:flutter/material.dart';

import '../widgets/auth_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            AuthTextField(hintText: 'Name'),
            SizedBox(
              height: 15,
            ),
            AuthTextField(hintText: 'Email'),
            SizedBox(
              height: 15,
            ),
            AuthTextField(hintText: 'Password'),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
