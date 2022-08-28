import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pmdc_lms/utils/app_constants.dart';

class QueryToTeacherService {
  Future queryToTeacher(
    String TeacherID,
    String StudentQuery,
  ) async {
    final queryToTeacherUrl =
        Uri.parse('${AppConstants.baseUrl}SubmitQueryToTeacher.php');
    var response = await http.post(queryToTeacherUrl, body: {
      "TeacherID": TeacherID,
      "StudentQuery": StudentQuery,
      "CampusID": AppConstants.campusid,
      "RegNo": AppConstants.regNo,
      "StudentName": AppConstants.name,
    });
    print(response.body + " myyyyyy ressssponseeeee");
    print(response.statusCode.toString() + " myyyyyy ressssponseeeee");
    var result = json.decode(response.body);
    print(result);
    if (result == "Success") {
      print('Success');
    }
    if (response.statusCode == 200) {
      // var data = response.body;
      // print("JSON DECODED DATA:" + jsonDecode(data));
      var data = json.decode(response.body);
      print(data);
      // print(data['status']);
      // print(data['data'][0]['regid']);
      return data;
    } else {
      // print('SOME error occurred i.e. ' + response.statusCode.toString());
    }
  }
}
