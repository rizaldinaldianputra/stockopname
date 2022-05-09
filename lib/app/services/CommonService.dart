import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:stock_op_name/app/config/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonService {
  static final String url = API_URL;

  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  late Dio _dio;
  CommonService(context) {
    _dio = Dio(opts);
    _dio.interceptors.add(getInterceptorWrapper());
  }
  InterceptorsWrapper getInterceptorWrapper() {
    return InterceptorsWrapper(
      onError: (error, errorInterceptor) async {
        if (error.response == null) {
          Fluttertoast.showToast(
              msg: "Network Error, Pleases Check your Network",
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 13);
          return;
        }
        if (error.response!.statusCode == 401) {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.remove("user");
          sharedPreferences.remove("token");
          Get.offAllNamed('/login');
          Fluttertoast.showToast(
              msg: "Not Authorized Access",
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 13);
          return errorInterceptor.resolve(error.response!);
        } else {
          Fluttertoast.showToast(
              msg: error.response!.statusCode.toString() +
                  "-" +
                  error.response!.data["message"],
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 13);
          return errorInterceptor.resolve(error.response!);
        }
      },
      onRequest: (request, requestInterceptor) async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String? token = '';
        token = sharedPreferences.getString("token");
        if (token != null)
          request.headers.addAll({"Authorization": "Bearer $token"});
        return requestInterceptor.next(request);
      },
      onResponse: (response, handler) async {
        if (response.statusCode == 401) {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.remove("user");
          sharedPreferences.remove("token");
          Get.offAllNamed('/login');
          return;
        }
        return handler.next(response);
      },
    );
  }

  static dynamic errorInterceptor(RequestOptions options) async {
    // Get your JWT token
    const token = '';
    options.headers.addAll({"Authorization": "Bearer: $token"});
    return options;
  }

  Future<Response> getHTTP(String url) async {
    try {
      Response response = await _dio.get(url);
      return Future.value(response);
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  Future<Response> postHTTP(String url, dynamic data) async {
    try {
      String json = jsonEncode(data);

      Response response = await _dio.post(url, data: json);
      return response;
    } on DioError catch (e) {
      if (e.response == null)
        return Future.error(e.message);
      else
        return Future.error(e.response!.data['message']);
    }
  }

  Future<Response> putHTTP(String url, dynamic data) async {
    try {
      Response response = await _dio.put(url, data: data);
      return Future.value(response);
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  Future<Response> deleteHTTP(String url) async {
    try {
      Response response = await _dio.delete(url);
      return Future.value(response);
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
