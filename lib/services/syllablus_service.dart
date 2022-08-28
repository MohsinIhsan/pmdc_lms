import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pmdc_lms/utils/app_constants.dart';

class SyllabusService {
  Future syllabus(String subject) async {
    final syllabusUrl = Uri.parse('${AppConstants.baseUrl}Syllabus.php');
    var response = await http.post(syllabusUrl, body: {
      "subject": subject,
      "class": AppConstants.myClass,
      "campusid": AppConstants.campusid
    });
    if (response.statusCode == 200) {
      // var data = response.body;
      // print("JSON DECODED DATA:" + jsonDecode(data));
      Map<String, dynamic> data = json.decode(response.body);
      // print(data);
      // print(data['status']);
      // print(data['data'][0]['regid']);
      return data;
    } else {
      // print('SOME error occurred i.e. ' + response.statusCode.toString());
    }
  }
}
