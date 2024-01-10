import 'package:flutter/material.dart';
import 'package:flutter_login_exercise/database_local/controller/homepage_controller.dart';
import 'package:flutter_login_exercise/database_local/models/use_model.dart';
import 'package:flutter_login_exercise/database_local/pages/adddata_view.dart';
import 'package:flutter_login_exercise/database_local/pages/editdata_view.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);
  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FLutter SQFlite CRUD"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<UserModel>>(
            future: controller.getDataUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      UserModel user = snapshot.data![index];
                      // print(user.nama);
                      return ListTile(
                        // leading: CircleAvatar(child: Icon(Icons.person)),
                        title: Text(user.nama! ?? ""),
                        subtitle: Text(user.email! ?? ""),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.to(EditDataView(), arguments: [user.id, user.nama, user.email]);
                              },
                              icon: Icon(Icons.edit),
                            ),

                            IconButton(
                              onPressed: () {
                                controller.delete(snapshot.data![index].id!);
                                Get.snackbar("Sukses", "Data berhasil dihapus");
                                Get.offAll(HomePageView());
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return Center(
                  child: Text("nodata"),
                );
              }
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(AddDataView());
            },
            child: Icon(Icons.add)));
  }
}
