import 'package:flutter/material.dart';
import 'package:flutter_login_exercise/pak_aji/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginPakAjiView extends StatelessWidget {
  LoginPakAjiView({Key? key}) : super(key: key);
  final controller = Get.put(LoginPakAjiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(9),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 23, left: 23, right: 23, top: 27),
              child: TextFormField(
                controller: controller.ctrEmail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Email",
                    label: Text("Username")),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 23, left: 23, right: 23),
              child: TextFormField(
                controller: controller.ctrPassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Password",
                    label: Text("Password")),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.loginAction(
                      controller.ctrEmail!.text, controller.ctrPassword!.text);
                  print(controller.isLoading.value);
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
