import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/searchproduct_controller.dart';

class SearchproductView extends GetView<SearchproductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: 'Search Product',
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          "Product $index",
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Text("Satuan $index"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      elevation: 4,
                      shadowColor: Colors.purple,
                      margin: EdgeInsets.all(10),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          )),
                    );
                  }))
        ],
      ),
    );
  }
}
