import 'dart:convert';

import 'package:flutter_front/providers/provider_login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  String email = '';
  String password = '';
  String apiError = '';

  void changeApiError(String newApiError) {
    apiError = newApiError;
    update();
  }

  Future<bool> login() async {
    dynamic data = {
      'email': email,
      'password': password,
    };

    http.Response response = await LoginProvider.login(data);
    dynamic jsonResponse = jsonDecode(response.body);

    if (jsonResponse['message'] == 'failed') {
      changeApiError(jsonResponse['error']);
      return false;
    } else {
      changeApiError('');
      return true;
    }
  }
}
