import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techtonic_blog_app/features/auth/presentation/screens/login_screen.dart';
import 'package:techtonic_blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:techtonic_blog_app/features/core/theme/app_palette.dart';

import '../bloc/auth_bloc.dart';
import '../widgets/auth_textfield.dart';

class SignUpScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpScreen());
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
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
              const SizedBox(height: 30),
              AuthTextField(hintText: 'Name', controller: nameController),
              const SizedBox(height: 15),
              AuthTextField(
                hintText: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 15),
              AuthTextField(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 20),
              AuthGradientButton(
                buttonText: 'Sign Up',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(AuthSignUp(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        name: nameController.text.trim()));
                  }
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: RichText(
                  text: TextSpan(
                      text: 'Already have an account ? ',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
