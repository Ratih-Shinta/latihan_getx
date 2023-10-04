import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginPageController extends GetxController {
  TextEditingController? cEmail;
  TextEditingController? cPassword;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cEmail = new TextEditingController();
    cPassword = new TextEditingController();
  }

  loginUser() async {
    final baseUrl = 'https://reqres.in/api/login';

    isLoading.value = true;
    final response = await http.post(Uri.parse(baseUrl),
        body: {'email': cEmail!.text, 'password': cPassword!.text});
    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> getToken = jsonDecode(response.body);
        final token = getToken['token'];
        print(token);
        Get.snackbar("Selamat", "Login Sukses");
        isLoading.value = false;
      } else {
        Get.snackbar("Maaf", "Gagal Login");
      }
    } catch (e) {
      print(e);
    }
  }
}