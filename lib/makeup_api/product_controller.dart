import 'package:flutter_login_exercise/makeup_api/product_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var isLoading = true.obs;
  RxList<ProductResponseModel> productresponsemodel =
      <ProductResponseModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      final response = await http.get(Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
      if (response.statusCode == 200) {
        productresponsemodel.value =
            productResponseModelFromJson(response.body);
        isLoading(true).obs;
      } else {
        print('error: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}
