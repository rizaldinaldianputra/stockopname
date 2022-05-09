import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/searchproduct_controller.dart';

class SearchproductView extends GetView<SearchproductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Product'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pink.shade300,
                Colors.purple.shade100.withOpacity(0.5),
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Search Product',
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        height: 100,
                        child: Card(
                            elevation: 3,
                            child: ListTile(
                                onTap: () {
                                  Get.offNamed('/scan');
                                },
                                trailing: Icon(Icons.navigate_next),
                                subtitle: Text('Satuan'),
                                title: Text('Product Name ${index + 1}'))),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
