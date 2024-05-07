import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';

class AuthGradientButton extends StatelessWidget {
  const AuthGradientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
        AppPalette.gradient1,
        AppPalette.gradient2,
      ])),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            fixedSize: Size(395, 55),
            backgroundColor: AppPalette.transparentColor,
            shadowColor: AppPalette.transparentColor),
        child: const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
