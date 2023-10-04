import 'package:flutter/material.dart';
import 'package:flutter_login_exercise/makeup_api/product_controller.dart';
import 'package:get/get.dart';

class MakeupHomePage extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api makeup"),
      ),
      body: Obx(
        () => productController.isLoading.value
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: productController.productresponsemodel.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = productController.productresponsemodel[index];
                  return Container(
                    margin: EdgeInsets.all(15),
                    child: ListTile(
                      leading: Image.network(product.imageLink),
                      title: Text(product.name),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
