import 'package:flutter/material.dart';
import 'package:pmdc_lms/views/screens/attendance/attendance_screen.dart';
import 'package:pmdc_lms/views/screens/auth/login_screen.dart';
import 'package:pmdc_lms/views/screens/dashboard/dashboard_screen.dart';
import 'package:pmdc_lms/views/screens/datesheet/datesheet_screen.dart';
import 'package:pmdc_lms/views/screens/examination/examination_screen.dart';
import 'package:pmdc_lms/views/screens/fee_record/fee_record_screen.dart';
import 'package:pmdc_lms/views/screens/profile/profile_screen.dart';
import 'package:pmdc_lms/views/screens/subjects/subject_screen.dart';
import 'package:pmdc_lms/views/screens/timetable/timetable_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    LoginScreen.id: (ctx) => LoginScreen(),
    DashboardScreen.id: (context) => DashboardScreen(),
    ProfileScreen.id: (context) => ProfileScreen(),
    SubjectScreen.id: (context) => SubjectScreen(),
    TimeTableScreen.id: (context) => TimeTableScreen(),
    FeeRecordScreen.id: (context) => FeeRecordScreen(),
    AttendanceScreen.id: (context) => AttendanceScreen(),
    DateSheetScreen.id: (context) => DateSheetScreen(),
    ExaminationScreen.id: (context) => ExaminationScreen(),
  };
}
