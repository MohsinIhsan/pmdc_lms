import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmdc_lms/utils/app_colors.dart';
import 'package:pmdc_lms/utils/app_dimensions.dart';
import 'package:pmdc_lms/views/screens/attendance/attendance_screen.dart';
import 'package:pmdc_lms/views/screens/datesheet/datesheet_screen.dart';

import '../screens/timetable/timetable_screen.dart';

class DashboardCardTwo extends StatelessWidget {
  final String labelText;
  final IconData iconData;
  const DashboardCardTwo({
    Key? key,
    required this.labelText,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.r),
          onTap: () {
            labelText == 'Time Table'
                ? Navigator.pushNamed(context, TimeTableScreen.id)
                : labelText == 'Attendance'
                    ? Navigator.pushNamed(context, AttendanceScreen.id)
                    : labelText == 'Date Sheet'
                        ? Navigator.pushNamed(context, DateSheetScreen.id)
                        : null;
          },
          child: Container(
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              // color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Container(
                      height: 30.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.orange1.shade300,
                            AppColors.primary.shade300,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                        // color: Colors.white,
                      ),
                      child: Icon(
                        iconData,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    labelText,
                    style: TextStyle(
                        fontSize: AppDimensions.FONT_SIZE_LARGE,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black_light),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
