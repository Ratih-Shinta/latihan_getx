import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePakAjiController extends GetxController {
  late final SharedPreferences prefs;
  RxString strName = "".obs;

  @override
  void onInit() {
    super.onInit();
    chechSharedPreference();
  }

  void chechSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
    strName.value = prefs.getString('token') ?? "no data";
  }
}
