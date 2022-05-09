import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.logout();
              },
              icon: Icon(Icons.exit_to_app),
            )
          ],
          title: Text(
            'Dashboard ' + controller.user.value.nikuser,
            style: TextStyle(fontSize: 20),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.pink.shade300,
              Colors.purple.shade100.withOpacity(0.5),
            ])),
          ),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Get.toNamed('/scan');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Icon(Icons.camera_alt, size: 50),
                ),
                color: Colors.pink.shade200,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/product');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Icon(Icons.qr_code_scanner, size: 50),
                ),
                color: Colors.purple.shade200,
              ),
            ),
          ],
        )));
  }
}
