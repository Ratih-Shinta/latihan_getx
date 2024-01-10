import 'package:flutter/material.dart';
import 'package:flutter_login_exercise/database_local/controller/adddata_controller.dart';
import 'package:get/get.dart';

class AddDataView extends StatelessWidget {
  AddDataView({super.key});
  final controller = Get.put(AddDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Data"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              controller: controller.namaController,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.insert();
                },
                child: Text("Simpan data"))
          ],
        ));
  }
}
