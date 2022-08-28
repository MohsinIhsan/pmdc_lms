import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pmdc_lms/utils/app_constants.dart';

class SubjectDiaryDetailService {
  Future subjectDiaryDetail(String subject) async {
    final subjectDiaryDetailUrl =
        Uri.parse('${AppConstants.baseUrl}subjectDiaryDetails.php');
    var response = await http.post(subjectDiaryDetailUrl, body: {
      "regno": AppConstants.regNo,
      "campusid": AppConstants.campusid,
      "subject": subject,
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
