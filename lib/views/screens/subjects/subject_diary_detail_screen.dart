import 'package:flutter/material.dart';
import 'package:pmdc_lms/services/subject_diary_detail_service.dart';
import 'package:pmdc_lms/utils/app_colors.dart';
import 'package:pmdc_lms/utils/app_dimensions.dart';
import 'package:pmdc_lms/views/basewidgets/shimmer_effect.dart';

class SubjectDiaryDetailScreen extends StatefulWidget {
  static const String id = 'subject_diary_detail_screen';

  final String subject;
  final String isUrdu;

  const SubjectDiaryDetailScreen(
      {Key? key, required this.subject, required this.isUrdu})
      : super(key: key);

  @override
  State<SubjectDiaryDetailScreen> createState() =>
      _SubjectDiaryDetailScreenState();
}

class _SubjectDiaryDetailScreenState extends State<SubjectDiaryDetailScreen> {
  late bool loading;
  late List subjectsDiaryDetailList;
  String? teacherName;

  getSubjectDiaryDetail() async {
    await SubjectDiaryDetailService()
        .subjectDiaryDetail(widget.subject)
        .then((value) => setState(() {
              // print(value);
              print(value['TeacherName']);
              teacherName = value['TeacherName'];
              List<dynamic> dataList = value['subjectDiaryDetails'];
              subjectsDiaryDetailList = dataList;
              print(subjectsDiaryDetailList);
              loading = false;
            }));
  }

  @override
  void initState() {
    super.initState();
    loading = true;
    getSubjectDiaryDetail();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.black_light,
        title: Text(
          ' Subject Diary',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: loading
          ? ShimmerEffect()
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: size.height * 0.14,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primary.shade500,
                            AppColors.orange2.withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 90,
                                  child: Text(
                                    "Instructor: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white,
                                        fontSize:
                                            AppDimensions.FONT_SIZE_LARGE),
                                  ),
                                ),
                                Text(
                                  teacherName!,
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize:
                                          AppDimensions.FONT_SIZE_EXTRA_LARGE),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 90,
                                  child: Text(
                                    "Subject: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white,
                                        fontSize:
                                            AppDimensions.FONT_SIZE_LARGE),
                                  ),
                                ),
                                Text(
                                  widget.subject,
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize:
                                          AppDimensions.FONT_SIZE_EXTRA_LARGE),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                    itemCount: subjectsDiaryDetailList.length,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 4,
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.zero,
                          child: ExpansionTile(
                            backgroundColor: AppColors.clr7,
                            collapsedBackgroundColor: AppColors.clr9,
                            // backgroundColor: AppColors.clr1,
                            leading: Container(
                              width: 80,
                              height: double.infinity,
                              child: Center(
                                child: Text(
                                  "Day : " +
                                      subjectsDiaryDetailList[index]['Day'],
                                  style: TextStyle(
                                      fontSize: AppDimensions.FONT_SIZE_LARGE,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black_light),
                                ),
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Chapter : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppDimensions.FONT_SIZE_LARGE,
                                      color: AppColors.black_light),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Text(
                                    subjectsDiaryDetailList[index]['Chapter'],
                                    style: TextStyle(
                                        fontSize: AppDimensions.FONT_SIZE_LARGE,
                                        color: AppColors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      thickness: 1,
                                      color: AppColors.orange1,
                                    ),
                                    Text(
                                      "Status : " +
                                          subjectsDiaryDetailList[index]
                                              ['Status'],
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.FONT_SIZE_LARGE,
                                          color: AppColors.black),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: AppColors.orange1,
                                    ),
                                    Text(
                                      "Delivered Date : " +
                                          subjectsDiaryDetailList[index]
                                              ['DeliveredDate'],
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.FONT_SIZE_LARGE,
                                          color: AppColors.black),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: AppColors.orange1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        "Chapter Name : ",
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.FONT_SIZE_LARGE,
                                            color: AppColors.black),
                                      ),
                                    ),
                                    Text(
                                      subjectsDiaryDetailList[index]
                                          ['ChapterName'],
                                      textDirection: widget.isUrdu == 'Yes'
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.FONT_SIZE_LARGE,
                                          color: AppColors.black),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: AppColors.orange1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        "Topics : ",
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.FONT_SIZE_LARGE,
                                            color: AppColors.black),
                                      ),
                                    ),
                                    Text(
                                      subjectsDiaryDetailList[index]['Topic'],
                                      textDirection: widget.isUrdu == 'Yes'
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.FONT_SIZE_LARGE,
                                          color: AppColors.black),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: AppColors.orange1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        "Class Details : ",
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.FONT_SIZE_LARGE,
                                            color: AppColors.black),
                                      ),
                                    ),
                                    Text(
                                      subjectsDiaryDetailList[index]['Details'],
                                      textDirection: widget.isUrdu == 'Yes'
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.FONT_SIZE_LARGE,
                                          color: AppColors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
    );
  }
}
