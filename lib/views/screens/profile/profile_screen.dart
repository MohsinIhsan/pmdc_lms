import 'package:flutter/material.dart';
import 'package:pmdc_lms/utils/app_colors.dart';
import 'package:pmdc_lms/utils/app_constants.dart';
import 'package:pmdc_lms/utils/app_dimensions.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // drawer: DrawerScreen(),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: AppColors.black_light,
        title: Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary.shade400,
                          AppColors.orange1.shade400,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      // color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.orange1,
                          radius: 60,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 58,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              radius: 56,
                              child: ClipOval(
                                child: Image.network('${AppConstants.picture}'),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          AppConstants.name!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                              fontSize: AppDimensions.FONT_SIZE_LARGE),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.clr9,
                          AppColors.clr7,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      // color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: SizedBox(
                              width: 110,
                              child: Text(
                                'Name:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppDimensions.FONT_SIZE_LARGE,
                                    color: AppColors.black_light),
                              ),
                            ),
                            title: Text(
                              AppConstants.name!,
                              style: TextStyle(
                                  color: AppColors.black_light,
                                  fontSize: AppDimensions.FONT_SIZE_LARGE),
                            ),
                          ),
                          const Divider(
                            color: AppColors.orange1,
                          ),
                          ListTile(
                            leading: SizedBox(
                              width: 110,
                              child: Text(
                                'Father Name:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppDimensions.FONT_SIZE_LARGE,
                                    color: AppColors.black_light),
                              ),
                            ),
                            title: Text(
                              AppConstants.fname!,
                              style: TextStyle(
                                  fontSize: AppDimensions.FONT_SIZE_LARGE,
                                  color: AppColors.black_light),
                            ),
                          ),
                          const Divider(
                            color: AppColors.orange1,
                          ),
                          ListTile(
                            leading: SizedBox(
                              width: 110,
                              child: Text(
                                'Student ID:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppDimensions.FONT_SIZE_LARGE,
                                    color: AppColors.black_light),
                              ),
                            ),
                            title: Text(
                              AppConstants.regNo!,
                              style: TextStyle(
                                  fontSize: AppDimensions.FONT_SIZE_LARGE,
                                  color: AppColors.black_light),
                            ),
                          ),
                          const Divider(
                            color: AppColors.orange1,
                          ),
                          ListTile(
                            leading: SizedBox(
                              width: 110,
                              child: Text(
                                'DOB:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppDimensions.FONT_SIZE_LARGE,
                                    color: AppColors.black_light),
                              ),
                            ),
                            title: Text(
                              AppConstants.dob!,
                              style: TextStyle(
                                  fontSize: AppDimensions.FONT_SIZE_LARGE,
                                  color: AppColors.black_light),
                            ),
                          ),
                          const Divider(
                            color: AppColors.orange1,
                          ),
                          ListTile(
                            leading: SizedBox(
                              width: 110,
                              child: Text(
                                'Class:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppDimensions.FONT_SIZE_LARGE,
                                    color: AppColors.black_light),
                              ),
                            ),
                            title: Text(
                              AppConstants.myClass!,
                              style: TextStyle(
                                  fontSize: AppDimensions.FONT_SIZE_LARGE,
                                  color: AppColors.black_light),
                            ),
                          ),
                          const Divider(
                            color: AppColors.orange1,
                          ),
                          ListTile(
                            leading: SizedBox(
                              width: 110,
                              child: Text(
                                'Program:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppDimensions.FONT_SIZE_LARGE,
                                    color: AppColors.black_light),
                              ),
                            ),
                            title: Text(
                              AppConstants.program!,
                              style: TextStyle(
                                  fontSize: AppDimensions.FONT_SIZE_LARGE,
                                  color: AppColors.black_light),
                            ),
                          ),
                          const Divider(
                            color: AppColors.orange1,
                          ),
                          ListTile(
                            leading: SizedBox(
                              width: 110,
                              child: Text(
                                'Section:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppDimensions.FONT_SIZE_LARGE,
                                    color: AppColors.black_light),
                              ),
                            ),
                            title: Text(
                              AppConstants.section!,
                              style: TextStyle(
                                  fontSize: AppDimensions.FONT_SIZE_LARGE,
                                  color: AppColors.black_light),
                            ),
                          ),
                          const Divider(
                            color: AppColors.orange1,
                          ),
                          ListTile(
                            leading: SizedBox(
                              width: 110,
                              child: Text(
                                'Session:',
                                style: TextStyle(
                                    fontSize: AppDimensions.FONT_SIZE_LARGE,
                                    color: AppColors.black_light),
                              ),
                            ),
                            title: Text(
                              AppConstants.session!,
                              style: TextStyle(
                                  fontSize: AppDimensions.FONT_SIZE_LARGE,
                                  color: AppColors.black_light),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
