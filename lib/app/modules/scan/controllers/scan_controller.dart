import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ScanController extends GetxController {
  //TODO: Implement ScanController
  TextEditingController qty = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void decrement() => count.value--;
}
