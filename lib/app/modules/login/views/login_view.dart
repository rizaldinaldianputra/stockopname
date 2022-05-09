import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "package:dio/src/response.dart" as diopackage;
import 'package:stock_op_name/app/config/config.dart';
import 'package:stock_op_name/app/model/user.dart';
import 'package:stock_op_name/app/services/AuthService.dart';
import 'package:stock_op_name/app/services/user_service.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  double getSmallDiameter(BuildContext context) => Get.width * 4 / 3;
  double getBigDiameter(BuildContext context) => Get.width * 7 / 8;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late AuthService _authService;
  late UserService _userService;

  @override
  void initState() {
    super.initState();
    _authService = new AuthService(context);
    _userService = new UserService(context);

    _usernameController.text = '';
    _passwordController.text = '';

    init();
  }

  Future<void> init() async {
    checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getSmallDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.pink.shade900,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: -getBigDiameter(context) / 4,
            top: -getBigDiameter(context) / 4,
            child: Container(
              width: getBigDiameter(context),
              height: getBigDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.purple.shade900, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                height: Get.height * 0.3,
                child: LottieBuilder.asset(LOCAL_IMAGES_URL + '/login_bg.json'),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.fromLTRB(25, 35, 25, 35),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.person),
                            hintText: 'Username',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.lock),
                            hintText: 'Password',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
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
                                Colors.deepPurple.shade400,
                                Colors.deepPurple.shade200,
                              ],
                            ),
                            color: Colors.deepPurple.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
                            onPressed: () {
                              Get.toNamed('/home');
                              // login();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              child: Text(
                                'Login',
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
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  void login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    int? response = await _authService.authenticate(
        API_URL + '/authenticate', username, password);

    if (response == 200) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      diopackage.Response returnUser = await _userService.getinfo();
      if (returnUser.statusCode == 200) {
        sharedPreferences.setString("user", json.encode(returnUser.data));
        Map<String, dynamic> userJson =
            jsonDecode(sharedPreferences.getString("user") ?? '{}');
        var user = User.fromJson(userJson);
        Get.offNamed('/home');
      } else
        Fluttertoast.showToast(
            msg: 'Get Info Error',
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 13);
    } else {
      Fluttertoast.showToast(
          msg: 'Login Error',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 13);
    }
  }

  Future<void> checkToken() async {
    String? token = '';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");
    if (token != null && token.isNotEmpty) {
      Get.offNamed('/home');
      return;
    }
  }
}
