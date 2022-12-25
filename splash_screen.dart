import 'package:flutter/material.dart';
import 'package:whatsapp/core/app_colors.dart';

import '../../core/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleData(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text(
          "What's App",
          style: TextStyles.splashTextStyle,
        ),
      ),
    );
  }

  Future<void> handleData(context) async {
   await Future.delayed(Duration(seconds: 3));
   Navigator.of(context).pushNamedAndRemoveUntil("home_screen", (route) => false);
  }
}
