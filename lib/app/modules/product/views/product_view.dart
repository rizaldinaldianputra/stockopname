import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Get.toNamed('/searchproduct');
              },
            ),
          )
        ],
        title: Text('Product'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.pink.shade300,
            Colors.purple.shade100.withOpacity(0.5),
          ])),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              shadowColor: Colors.purple.shade100,
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'ID Product',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        '0882880108',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Name Product: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        'Product 1',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Satuan: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        'KG',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Barcode', style: TextStyle(fontSize: 20))),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.purple),
                          onPressed: () {
                            controller.scanBarcodeNormal();
                          },
                          child: Icon(
                            Icons.camera,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 800,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 5.0)
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                      colors: [
                        Colors.pink.shade300,
                        Colors.purple.shade100.withOpacity(0.5),
                      ],
                    ),
                    color: Colors.deepPurple.shade300,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),

                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      // elevation: MaterialStateProperty.all(3),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        'Simpan',
                        style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
