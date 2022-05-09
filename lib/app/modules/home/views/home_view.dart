import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.pink.shade300,
              Colors.purple.shade100.withOpacity(0.5),
            ])),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/scan');
                },
                child: Container(
                  height: 100,
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text('Item $index'),
                      trailing: Icon(Icons.link),
                    ),
                  ),
                ),
              );
            }));
  }
}
