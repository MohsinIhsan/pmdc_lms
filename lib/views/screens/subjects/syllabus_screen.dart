import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmdc_lms/services/pdf_service.dart';
import 'package:pmdc_lms/services/syllablus_service.dart';
import 'package:pmdc_lms/utils/app_colors.dart';
import 'package:pmdc_lms/utils/app_constants.dart';
import 'package:pmdc_lms/utils/app_dimensions.dart';
import 'package:pmdc_lms/views/basewidgets/shimmer_effect.dart';
import 'package:pmdc_lms/views/screens/pdfview/pdfview_screen.dart';

import 'dart:io';

class SyllabusScreen extends StatefulWidget {
  static const String id = 'syllabus_screen';

  final String subject;
  final String isUrdu;
  const SyllabusScreen({
    Key? key,
    required this.subject,
    required this.isUrdu,
  }) : super(key: key);

  @override
  State<SyllabusScreen> createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  late bool loading;
  late List syllabusList;

  getSyllabus() async {
    await SyllabusService()
        .syllabus(widget.subject)
        .then((value) => setState(() {
              print(value);
              List<dynamic> dataList = value['Syllabus'];
              syllabusList = dataList;
              print(syllabusList);
              loading = false;
            }));
  }

  @override
  void initState() {
    super.initState();
    loading = true;
    getSyllabus();
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PdfViewScreen(file: file)),
      );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.black_light,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
        title: Text(
          'Syllabus',
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 90,
                                    child: Text(
                                      "Subject : ",
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
                                        fontSize: AppDimensions
                                            .FONT_SIZE_EXTRA_LARGE),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 90,
                                    child: Text(
                                      "Program: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                          fontSize:
                                              AppDimensions.FONT_SIZE_LARGE),
                                    ),
                                  ),
                                  Text(
                                    AppConstants.program!,
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: AppDimensions
                                            .FONT_SIZE_EXTRA_LARGE),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                    itemCount: syllabusList.length,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 2,
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.zero,
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            backgroundColor: index % 2 == 0
                                ? AppColors.clr9
                                : AppColors.clr7,
                            collapsedBackgroundColor: AppColors.clr9,
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                      fontSize: AppDimensions.FONT_SIZE_LARGE,
                                      color: AppColors.black_light),
                                ),
                              ],
                            ),
                            title: Text(
                              syllabusList[index]['Type'],
                              style: TextStyle(
                                  fontSize: AppDimensions.FONT_SIZE_LARGE,
                                  color: AppColors.black_light),
                              textAlign: TextAlign.center,
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: Size(double.maxFinite,
                                            size.height * 0.05),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor: AppColors.orange1,
                                      ),
                                      onPressed: () async {
                                        final url =
                                            'http://pmdc.edu.pk/portal/cpanelE/syllabus/391442SY-Biology.pdf';
                                        final file =
                                            await PDFService.loadPDFFromNetwork(
                                                url);
                                        openPDF(context, file);
                                      },
                                      child: Text(
                                        'View',
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: AppDimensions
                                                .FONT_SIZE_EXTRA_LARGE),
                                      ),
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
