import 'package:flutter/material.dart';
import 'package:pmdc_lms/routes/argument_routes.dart';
import 'package:pmdc_lms/services/subject_service.dart';
import 'package:pmdc_lms/utils/app_colors.dart';
import 'package:pmdc_lms/utils/app_dimensions.dart';
import 'package:pmdc_lms/views/basewidgets/shimmer_effect.dart';
import 'package:pmdc_lms/views/screens/subjects/subject_detail_screen.dart';

class SubjectScreen extends StatefulWidget {
  static const String id = 'subject_screen';
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  late bool loading;
  late List subjectsList;

  getSubject() async {
    await SubjectService().subject().then((value) => setState(() {
          print(value);
          List<dynamic> dataList = value['subjectNames'];
          subjectsList = dataList;
          loading = false;
        }));
  }

  @override
  void initState() {
    super.initState();
    loading = true;
    getSubject();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.grey.shade100,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.black_light,
        title: Text(
          'My Subjects',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: loading
          ? ShimmerEffect()
          : ListView.builder(
              itemCount: subjectsList.length,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SubjectDetailScreen.id,
                        arguments: SubjectDetailArgs(
                          subjectsList[index]['SubjectName'],
                          subjectsList[index]['isUrdu'],
                          subjectsList[index]['TeacherID'],
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: size.height * 0.13,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                        width: 0.2, color: AppColors.grey),
                                  ),
                                  child: Container(
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: index == 0 || index == 6
                                            ? [
                                                AppColors.clr0.withOpacity(0.1),
                                                AppColors.clr0.withOpacity(0.3)
                                              ]
                                            : index == 1 || index == 7
                                                ? [
                                                    AppColors.clr1
                                                        .withOpacity(0.1),
                                                    AppColors.clr1
                                                        .withOpacity(0.3),
                                                  ]
                                                : index == 2 || index == 8
                                                    ? [
                                                        AppColors.clr2
                                                            .withOpacity(0.1),
                                                        AppColors.clr2
                                                            .withOpacity(0.3),
                                                      ]
                                                    : index == 3 || index == 9
                                                        ? [
                                                            AppColors.clr3
                                                                .withOpacity(
                                                                    0.1),
                                                            AppColors.clr3
                                                                .withOpacity(
                                                                    0.3),
                                                          ]
                                                        : index == 4 ||
                                                                index == 10
                                                            ? [
                                                                AppColors.clr4
                                                                    .withOpacity(
                                                                        0.1),
                                                                AppColors.clr4
                                                                    .withOpacity(
                                                                        0.3),
                                                              ]
                                                            : index == 5 ||
                                                                    index == 11
                                                                ? [
                                                                    AppColors
                                                                        .clr5
                                                                        .withOpacity(
                                                                            0.1),
                                                                    AppColors
                                                                        .clr5
                                                                        .withOpacity(
                                                                            0.3),
                                                                  ]
                                                                : [
                                                                    AppColors
                                                                        .clr0
                                                                        .withOpacity(
                                                                            0.1),
                                                                    AppColors
                                                                        .clr0
                                                                        .withOpacity(
                                                                            0.3),
                                                                  ],
                                      ),
// color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.menu_book,
                                      color: AppColors.primary.shade600,
                                      size: 50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                subjectsList[index]['SubjectName'],
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.FONT_SIZE_EXTRA_LARGE,
                                    // fontWeight: FontWeight.bold,
                                    color: AppColors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
