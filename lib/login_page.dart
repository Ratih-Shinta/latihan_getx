import 'package:flutter/material.dart';
import 'package:flutter_login_exercise/login_page_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.all(9),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 23, left: 23, right: 23, top: 27),
                        child: TextFormField(
                          controller: controller.cEmail,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Masukkan Username",
                              label: Text("Username")),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(bottom: 23, left: 23, right: 23),
                        child: TextFormField(
                          controller: controller.cPassword,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Masukkan Password",
                              label: Text("Password")),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            controller.LoginUser();
                          },
                          child: Text("Login"))
                    ],
                  ),
                ),
        )
      );
  }
}
