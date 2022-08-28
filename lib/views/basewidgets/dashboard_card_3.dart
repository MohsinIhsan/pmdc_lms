import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmdc_lms/utils/app_colors.dart';
import 'package:pmdc_lms/utils/app_constants.dart';
import 'package:pmdc_lms/utils/app_dimensions.dart';
import 'package:pmdc_lms/views/screens/auth/login_screen.dart';
import 'package:pmdc_lms/views/screens/examination/examination_screen.dart';
import 'package:pmdc_lms/views/screens/subjects/subject_screen.dart';

import '../screens/fee_record/fee_record_screen.dart';

class DashboardCardThree extends StatefulWidget {
  final String labelText1, labelText2;
  const DashboardCardThree({
    Key? key,
    required this.labelText1,
    required this.labelText2,
  }) : super(key: key);

  @override
  State<DashboardCardThree> createState() => _DashboardCardThreeState();
}

class _DashboardCardThreeState extends State<DashboardCardThree> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(20.r),
                onTap: () {
                  widget.labelText1 == 'My Subjects'
                      ? Navigator.of(context).pushNamed(SubjectScreen.id)
                      : widget.labelText1 == 'Examination'
                          ? Navigator.of(context)
                              .pushNamed(ExaminationScreen.id)
                          : widget.labelText1 == 'Fee Record'
                              ? Navigator.of(context)
                                  .pushNamed(FeeRecordScreen.id)
                              : null;
                },
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    // color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 25, bottom: 25),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(width: 0.1, color: AppColors.grey),
                              borderRadius: BorderRadius.circular(13.r),
                            ),
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.grey.shade50,
                                borderRadius: BorderRadius.circular(13.r),
                                // color: Colors.white,
                              ),
                              child: Center(
                                child: Icon(
                                  widget.labelText1 == 'My Subjects'
                                      ? Icons.menu_book_sharp
                                      : widget.labelText1 == 'Fee Record'
                                          ? Icons.receipt_long_outlined
                                          : widget.labelText1 == 'Examination'
                                              ? Icons.explicit_outlined
                                              : Icons.menu_book_sharp,
                                  size: size.height * 0.04,
                                  color: AppColors.primary.shade700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            widget.labelText1,
                            style: TextStyle(
                                fontSize: AppDimensions.FONT_SIZE_LARGE,
                                // fontWeight: FontWeight.bold,
                                color: AppColors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
              flex: 1,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.r),
                  onTap: () {
                    widget.labelText2 == 'My Subjects'
                        ? Navigator.of(context).pushNamed(SubjectScreen.id)
                        : widget.labelText2 == 'Sign Out'
                            ? () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    'Successfully Sign Out',
                                    textAlign: TextAlign.center,
                                  ),
                                  duration: const Duration(seconds: 1),
                                ));
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    LoginScreen.id,
                                    (Route<dynamic> route) => false);

                                print(
                                    'Before signout:${AppConstants.campusid}');
                                setState(() {
                                  AppConstants.campusid = null;
                                });
                                print('After signout:${AppConstants.campusid}');
                              }()
                            : null;
                  },
                  child: Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      // color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          widget.labelText2 == 'Notice Board'
                              ? Icons.developer_board
                              : widget.labelText2 == 'Test'
                                  ? Icons.fact_check_outlined
                                  : Icons.logout,
                          size: 30.r,
                          color: AppColors.primary.shade700,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Flexible(
                          child: Text(
                            widget.labelText2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppDimensions.FONT_SIZE_LARGE,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
