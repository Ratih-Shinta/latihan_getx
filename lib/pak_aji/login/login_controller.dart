import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login_exercise/pak_aji/home/home_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPakAjiController extends GetxController {
  TextEditingController? ctrEmail;
  TextEditingController? ctrPassword;
  RxBool isLoading = false.obs;
  RxBool isSuccess = false.obs;
  late final SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
    ctrEmail = new TextEditingController();
    ctrPassword = new TextEditingController();
  }

  loginAction(String email, String password) async {
    final baseUrl = 'https://reqres.in/api/login';
    isLoading.value = true;

    final response = await http.post(Uri.parse(baseUrl),
        body: {'email': ctrEmail!.text, 'password': ctrPassword!.text});
    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> getToken = jsonDecode(response.body);
        final token = getToken['token'];

        prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        Get.snackbar("Selamat", "Login sukses");
        Get.off(HomePagePakAjiView());
        isSuccess.value = true;
        isLoading.value = false;
      } else {
        Get.snackbar("Maaf", "Gagal login");
      }
    } catch (e) {
      print(e);
    }
  }
}
