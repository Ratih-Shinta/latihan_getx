import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login_exercise/database_local/models/use_model.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class HomePageController extends GetxController {
  Database? database;
  // void initDatabase() async {
  //   String db_name = "db_user";
  //   int db_version = 1;
  //   String table = "user";

  //   Directory directory = await getApplicationDocumentsDirectory();
  //   String path = directory.path + db_name;

  Future<void> initDatabase() async {
    String db_name = "db_user";
    int db_version = 1;
    String table = "user";

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + db_name;

    if (database == null) {
      database = await openDatabase(path, version: db_version,
          onCreate: (db, version) {
        db.execute(
            "CREATE TABLE $table (id INTEGER PRIMARY KEY AUTOINCREMENT, nama VARCHAR(255), email VARCHAR(255))");
      });
    }
  }

  Future<List<UserModel>> getDataUser() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);
    final data = await database!.query('user');
    List<UserModel> user = data.map((e) => UserModel.fromJson(e)).toList();
    return user;
  }

  Future<void> delete(int id) async {
    String table = "user";
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);
    await database!.delete(table, where: "id =?", whereArgs: [id]);
  }

  @override
  void onInit() {
    initDatabase();
    super.onInit();
  }
}

getDataUser() {}

void delete(int i) {}
