import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  String _scanBarcode = 'Unknown';

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    Fluttertoast.showToast(
        msg: barcodeScanRes,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 13);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner Product'),
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
          GestureDetector(
            onTap: () {
              scanBarcodeNormal();
            },
            child: Container(
              color: Colors.grey.shade100,
              height: 200,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    elevation: 7,
                    child: Container(
                      child: Center(
                        child: Icon(
                          Icons.camera,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.pink.shade300,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/searchproduct');
                    },
                    child: Card(
                      elevation: 7,
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.search,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.purple.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              elevation: 6,
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'ID Barcode: ',
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 80,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green),
                                onPressed: () {
                                  controller.increment();
                                },
                                child: Text(
                                  ' + ',
                                  style: TextStyle(fontSize: 20),
                                )),
                          ),
                          SizedBox(width: 40),
                          SizedBox(
                            height: 40,
                            width: 80,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                                onPressed: () {
                                  controller.decrement();
                                },
                                child: Text(
                                  ' - ',
                                  style: TextStyle(fontSize: 28),
                                )),
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: TextField(
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
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
                borderRadius: BorderRadius.circular(20),
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
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
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
          ),
        ],
      ),
    );
  }
}
