import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Get.offAllNamed('login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Center(
            child: Container(
              child: Center(
                child: Container(
                  width: 400,
                  height: 300,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/SO.png'),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            height: 40,
            child: Center(
              child: LoadingIndicator(
                  strokeWidth: 2,
                  indicatorType: Indicator.ballRotate,
                  colors: const [
                    Colors.blue,
                    Colors.purple,
                  ],
                  pathBackgroundColor: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
