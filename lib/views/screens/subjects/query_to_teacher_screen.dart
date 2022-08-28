import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmdc_lms/services/query_to_teacher_service.dart';
import 'package:pmdc_lms/utils/app_colors.dart';
import 'package:pmdc_lms/utils/app_constants.dart';
import 'package:pmdc_lms/utils/app_dimensions.dart';

class QueryToTeacherScreen extends StatefulWidget {
  static const String id = 'query_to_teacher_screen';

  final String subject;
  final String isUrdu;
  final String TeacherID;

  const QueryToTeacherScreen({
    Key? key,
    required this.subject,
    required this.isUrdu,
    required this.TeacherID,
  }) : super(key: key);

  @override
  State<QueryToTeacherScreen> createState() => _QueryToTeacherScreenState();
}

class _QueryToTeacherScreenState extends State<QueryToTeacherScreen> {
  late bool loading;
  late List notesList;

  final _formKey = GlobalKey<FormState>();
  TextEditingController queryController = TextEditingController();

  queryToTeacher() async {
    await QueryToTeacherService()
        .queryToTeacher(
          widget.TeacherID,
          queryController.text,
        )
        .then((value) => setState(() {
              print(value);
              if (value == 'Success') {
                print('Submitted Submitted Submitted Submitted');
              }
              Navigator.pop(context);
            }));
  }

  @override
  void initState() {
    super.initState();
    loading = true;
  }

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
          'Student Queries',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
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
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 90,
                              child: Text(
                                "Subject : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                    fontSize: AppDimensions.FONT_SIZE_LARGE),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 90,
                              child: Text(
                                "Program: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                    fontSize: AppDimensions.FONT_SIZE_LARGE),
                              ),
                            ),
                            Text(
                              AppConstants.program!,
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize:
                                      AppDimensions.FONT_SIZE_EXTRA_LARGE),
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
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    top: 40,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Type Your Query',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE,
                          color: AppColors.black_light),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  child: TextFormField(
                    maxLines: null,
                    minLines: 15,
                    controller: queryController,
                    decoration: InputDecoration(
                      hintText: 'Type Message Here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.maxFinite, size.height * 0.05),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: AppColors.orange1,
              ),
              onPressed: queryToTeacher,
              child: Text(
                'Submit',
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
