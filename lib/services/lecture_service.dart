import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pmdc_lms/utils/app_constants.dart';

class LectureService {
  Future lectures(String subject) async {
    final lectureUrl = Uri.parse('${AppConstants.baseUrl}lectures.php');
    var response = await http.post(lectureUrl, body: {
      "subject": subject,
      "class": AppConstants.myClass,
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      // print('SOME error occurred i.e. ' + response.statusCode.toString());
    }
  }
}
