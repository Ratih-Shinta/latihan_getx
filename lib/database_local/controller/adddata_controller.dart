import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login_exercise/database_local/models/use_model.dart';
import 'package:flutter_login_exercise/database_local/pages/homapage_view.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AddDataController extends GetxController {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  late Database? database;

  void insert() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);

    UserModel user = UserModel(
      nama: namaController.text,
      email: emailController.text,
    );
    final data = await database!.insert('user', user.toJson());
    Get.offAll(HomePageView());
  }
}
