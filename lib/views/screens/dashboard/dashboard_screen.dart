import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmdc_lms/services/profile_service.dart';
import 'package:pmdc_lms/utils/app_colors.dart';
import 'package:pmdc_lms/utils/app_constants.dart';
import 'package:pmdc_lms/utils/app_dimensions.dart';
import 'package:pmdc_lms/views/basewidgets/dashboard_card_2.dart';
import 'package:pmdc_lms/views/basewidgets/dashboard_card_3.dart';
import 'package:pmdc_lms/views/basewidgets/shimmer_effect.dart';
import 'package:pmdc_lms/views/screens/Drawer/drawer_screen.dart';
import 'package:pmdc_lms/views/screens/profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String id = 'dashboard_screen';
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var profile;
  late bool loading;
  getProfile() async {
    await ProfileService().Profile().then((value) => setState(() {
          print(value);
          profile = value;
          print(profile);
          AppConstants.name = profile['profile'][0]['name'];
          AppConstants.fname = profile['profile'][0]['fname'];
          AppConstants.dob = profile['profile'][0]['dob'];
          AppConstants.myClass = profile['profile'][0]['class'];
          AppConstants.program = profile['profile'][0]['program'];
          AppConstants.section = profile['profile'][0]['section'];
          AppConstants.picture = profile['profile'][0]['picture'];
          AppConstants.session = profile['profile'][0]['session'];

          loading = false;
        }));
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    loading = true;
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.grey.shade100,
      drawer: DrawerScreen(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: AppColors.black_light,
        title: Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: loading
          ? ShimmerEffect(
              isDashboard: true,
            )
          : ListView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Card(
                        elevation: 3.r,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 130.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.primary.withOpacity(0.9),
                                AppColors.primary.withOpacity(0.8),
                                AppColors.orange2.withOpacity(0.7),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Text(
                                    'Welcome Back,',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize:
                                            AppDimensions.FONT_SIZE_LARGE),
                                  ),
                                  Flexible(
                                    child: Text(
                                      AppConstants.name!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                          fontSize:
                                              AppDimensions.FONT_SIZE_LARGE),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      'ID: ${AppConstants.regNo}',
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize:
                                              AppDimensions.FONT_SIZE_LARGE),
                                    ),
                                  ),
                                  Text(
                                    'Class: ${AppConstants.myClass}',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize:
                                            AppDimensions.FONT_SIZE_LARGE),
                                  ),
                                  SizedBox(
                                    height: 0,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(ProfileScreen.id);
                                },
                                child: CircleAvatar(
                                  backgroundColor: AppColors.primary,
                                  radius: 56.r,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 54.r,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey[200],
                                      radius: 52.r,
                                      child: ClipOval(
                                        child: Image.network(
                                            '${AppConstants.picture}'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        children: [
                          DashboardCardTwo(
                            labelText: 'Time Table',
                            iconData: Icons.calendar_month,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          DashboardCardTwo(
                            labelText: 'Attendance',
                            iconData: Icons.co_present_outlined,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          DashboardCardTwo(
                            labelText: 'Date Sheet',
                            iconData: Icons.date_range,
                          ),
                        ],
                      ),
                    ),
                    DashboardCardThree(
                      labelText1: 'My Subjects',
                      labelText2: 'Test',
                    ),
                    DashboardCardThree(
                      labelText1: 'Examination',
                      labelText2: 'Notice Board',
                    ),
                    DashboardCardThree(
                      labelText1: 'Fee Record',
                      labelText2: 'Sign Out',
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
