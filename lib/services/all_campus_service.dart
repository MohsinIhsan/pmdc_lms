import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pmdc_lms/utils/app_constants.dart';

class AllCampusService {
  Future getAllCampus() async {
    var response = await http
        .get(Uri.parse('https://cu.edu.pk/pmdc_portal_api/institutes.php'));
    var jsonBody = response.body;
    print(jsonBody);
    var jsonData = json.decode(jsonBody);
    print('My DATA:');
    print(jsonData);
    List<dynamic> dataList = jsonData['institutes'];
    AppConstants.campusList = dataList;
    return "Success";
  }
}
