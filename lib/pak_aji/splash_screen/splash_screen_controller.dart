import 'package:flutter_login_exercise/pak_aji/home/home_view.dart';
import 'package:flutter_login_exercise/pak_aji/login/login_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPakAjiController extends GetxController {
  late final SharedPreferences prefs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkSharedPreference();
  }

  void checkSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 2), () async {
      if (prefs.getString('token') == null) {
        Get.off(LoginPakAjiView());
      } else {
        Get.off(HomePagePakAjiView());
      }
    });
  }
}
