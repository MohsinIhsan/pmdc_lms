import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pmdc_lms/utils/app_constants.dart';

class AssignmentService {
  Future assignment(String subject) async {
    final assignmentUrl = Uri.parse('${AppConstants.baseUrl}assignments.php');
    var response = await http.post(assignmentUrl, body: {
      "subject": subject,
      "class": AppConstants.myClass,
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
