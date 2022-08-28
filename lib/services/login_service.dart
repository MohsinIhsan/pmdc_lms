import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pmdc_lms/utils/app_constants.dart';

class LoginService {
  Future login(
      TextEditingController reg_no, TextEditingController password) async {
    String regno = reg_no.text;
    String pass = password.text;
    final loginUrl = Uri.parse('${AppConstants.baseUrl}login.php');
    var response = await http.post(loginUrl, body: {
      "regno": regno,
      "pass": pass,
      "campusid": AppConstants.campusid,
    });
    if (response.statusCode == 200) {
      // var data = response.body;
      // print("JSON DECODED DATA:" + jsonDecode(data));
      Map data = json.decode(response.body);
      print(data);
      // print(data['status']);
      // print(data['data'][0]['regid']);
      return data;
    } else {
      // print('SOME error occurred i.e. ' + response.statusCode.toString());
    }
  }
}
