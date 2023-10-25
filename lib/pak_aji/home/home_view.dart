import 'package:flutter/material.dart';
import 'package:flutter_login_exercise/pak_aji/home/home_controller.dart';
import 'package:get/get.dart';

class HomePagePakAjiView extends StatelessWidget {
  HomePagePakAjiView({super.key});
  HomePakAjiController homePakAjiController = Get.put(HomePakAjiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("user logged ${homePakAjiController.prefs.getString("token")}")
      ),
    );
  }
}