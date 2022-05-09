import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_op_name/app/model/user.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  Rx<User> user = User.blankUser().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Getuser();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("user");
    sharedPreferences.remove("token");
    Get.offAllNamed('/splash');
  }

  void Getuser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? users = sharedPreferences.getString('user');

    if (users != null) {
      user.value = User.fromJson(json.decode(users));
    }
  }
}
