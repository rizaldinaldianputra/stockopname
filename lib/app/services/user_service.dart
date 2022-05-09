import 'package:dio/dio.dart';
import 'package:stock_op_name/app/config/config.dart';

import 'CommonService.dart';

class UserService {
  late CommonService api;
  late Response response;
  String url = API_URL + '/user';
  String connErr = 'Please check your internet connection and try again';

  UserService(context) {
    api = CommonService(context);
  }

  Future<Response> getinfo() async {
    return response = await api.getHTTP(url + '/info');
  }
}
