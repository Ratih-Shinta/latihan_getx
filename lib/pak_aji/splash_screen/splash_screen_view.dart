import 'package:flutter/material.dart';
import 'package:flutter_login_exercise/pak_aji/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPakAjiController splashScreenPakAjiController = Get.put(SplashScreenPakAjiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('ini splash screen'),
        ),
      ),
    );
  }
}
