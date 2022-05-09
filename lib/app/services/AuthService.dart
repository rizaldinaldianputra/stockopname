import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CommonService.dart';

class AuthService {
  late CommonService api;
  String url = '/auth';
  String connErr = 'Please check your internet connection and try again';

  AuthService(context) {
    api = CommonService(context);
  }

  Future<int?> authenticate(url, String user, String password) async {
    Map<String, dynamic> attributeMap = new Map<String, dynamic>();
    attributeMap["username"] = user;
    attributeMap["password"] = password;

    Response response = await api.postHTTP(url, attributeMap);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    //  jsonResponse = json.decode(response.data);
    if (response.data['success'] == true) {
      sharedPreferences.setString("token", response.data['token']);
      return Future.value(response.statusCode);
    } else {
      return 401;
    }
  }
}
