import 'package:flutter/material.dart';
import 'package:pmdc_lms/routes/argument_routes.dart';
import 'package:pmdc_lms/utils/app_colors.dart';
import 'package:pmdc_lms/utils/app_dimensions.dart';
import 'package:pmdc_lms/views/screens/subjects/assignments_screen.dart';
import 'package:pmdc_lms/views/screens/subjects/lecture_videos_screen.dart';
import 'package:pmdc_lms/views/screens/subjects/subject_notes_screen.dart';
import 'package:pmdc_lms/views/screens/subjects/model_paper_screen.dart';
import 'package:pmdc_lms/views/screens/subjects/query_to_teacher_screen.dart';
import 'package:pmdc_lms/views/screens/subjects/subject_diary_detail_screen.dart';
import 'package:pmdc_lms/views/screens/subjects/syllabus_screen.dart';

class SubjectDetailScreen extends StatefulWidget {
  static const String id = 'subject_detail_screen';

  final String subject;
  final String isUrdu;
  final String TeacherID;
  const SubjectDetailScreen(
      {Key? key,
      required this.subject,
      required this.isUrdu,
      required this.TeacherID})
      : super(key: key);

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
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
          widget.subject,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SubjectDetailCard(
            index: 1,
            label: 'Lecture Videos',
            iconData: Icons.download,
            subject: widget.subject,
            isUrdu: widget.isUrdu,
          ),
          SubjectDetailCard(
            index: 2,
            label: 'Subject Notes',
            iconData: Icons.download,
            subject: widget.subject,
            isUrdu: widget.isUrdu,
          ),
          SubjectDetailCard(
            index: 3,
            label: 'Assignments',
            iconData: Icons.download,
            subject: widget.subject,
            isUrdu: widget.isUrdu,
          ),
          SubjectDetailCard(
            index: 4,
            label: 'Query to Teacher',
            iconData: Icons.download,
            subject: widget.subject,
            isUrdu: widget.isUrdu,
            TeacherID: widget.TeacherID,
          ),
          SubjectDetailCard(
            index: 5,
            label: 'Subject Diary',
            iconData: Icons.download,
            subject: widget.subject,
            isUrdu: widget.isUrdu,
          ),
          SubjectDetailCard(
            index: 6,
            label: 'MCQs',
            iconData: Icons.download,
            subject: widget.subject,
            isUrdu: widget.isUrdu,
          ),
          SubjectDetailCard(
            index: 7,
            label: 'Syllabus',
            iconData: Icons.download,
            subject: widget.subject,
            isUrdu: widget.isUrdu,
          ),
          SubjectDetailCard(
            index: 8,
            label: 'Model Paper',
            iconData: Icons.download,
            subject: widget.subject,
            isUrdu: widget.isUrdu,
          ),
          SubjectDetailCard(
            index: 9,
            label: 'Generate MCQ Test',
            iconData: Icons.download,
            subject: widget.subject,
            isUrdu: widget.isUrdu,
          ),
        ],
      ),
    );
  }
}

class SubjectDetailCard extends StatelessWidget {
  final String label;
  final IconData iconData;
  final int index;
  final String subject;
  final String isUrdu;
  String? TeacherID;
  SubjectDetailCard(
      {Key? key,
      required this.index,
      required this.label,
      required this.iconData,
      required this.subject,
      required this.isUrdu,
      this.TeacherID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            label == 'Assignments'
                ? Navigator.pushNamed(
                    context,
                    AssignmentsScreen.id,
                    arguments: AssignmentArgs(
                      subject,
                      isUrdu,
                    ),
                  )
                : label == 'Query to Teacher'
                    ? Navigator.pushNamed(
                        context,
                        QueryToTeacherScreen.id,
                        arguments: QueryToTeacherArgs(
                          subject,
                          isUrdu,
                          TeacherID!,
                        ),
                      )
                    : label == 'Lecture Videos'
                        ? Navigator.pushNamed(
                            context,
                            LectureVideosScreen.id,
                            arguments: LectureArgs(
                              subject,
                              isUrdu,
                            ),
                          )
                        : label == 'Model Paper'
                            ? Navigator.pushNamed(
                                context,
                                ModelPaperScreen.id,
                                arguments: ModelPaperArgs(
                                  subject,
                                  isUrdu,
                                ),
                              )
                            : label == 'Syllabus'
                                ? Navigator.pushNamed(
                                    context,
                                    SyllabusScreen.id,
                                    arguments: SyllabusArgs(
                                      subject,
                                      isUrdu,
                                    ),
                                  )
                                : label == 'Subject Diary'
                                    ? Navigator.pushNamed(
                                        context,
                                        SubjectDiaryDetailScreen.id,
                                        arguments: SubjectDiaryDetailArgs(
                                          subject,
                                          isUrdu,
                                        ),
                                      )
                                    : label == 'Subject Notes'
                                        ? Navigator.pushNamed(
                                            context,
                                            SubjectNotesScreen.id,
                                            arguments: NotesArgs(
                                              subject,
                                              isUrdu,
                                            ),
                                          )
                                        : null;
          },
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
                        side: BorderSide(width: 0.2, color: AppColors.grey),
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
                                    AppColors.clr0.withOpacity(0.3),
                                  ]
                                : index == 1 || index == 7
                                    ? [
                                        AppColors.clr1.withOpacity(0.1),
                                        AppColors.clr1.withOpacity(0.3),
                                      ]
                                    : index == 2 || index == 8
                                        ? [
                                            AppColors.clr2.withOpacity(0.1),
                                            AppColors.clr2.withOpacity(0.3),
                                          ]
                                        : index == 3 || index == 9
                                            ? [
                                                AppColors.clr3.withOpacity(0.1),
                                                AppColors.clr3.withOpacity(0.3),
                                              ]
                                            : index == 4 || index == 10
                                                ? [
                                                    AppColors.clr4
                                                        .withOpacity(0.1),
                                                    AppColors.clr4
                                                        .withOpacity(0.3),
                                                  ]
                                                : index == 5 || index == 11
                                                    ? [
                                                        AppColors.clr5
                                                            .withOpacity(0.1),
                                                        AppColors.clr5
                                                            .withOpacity(0.3),
                                                      ]
                                                    : [
                                                        AppColors.clr0
                                                            .withOpacity(0.1),
                                                        AppColors.clr0
                                                            .withOpacity(0.3),
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
                  child: Center(
                    child: Text(
                      label,
                      // subjectsList[index]['SubjectName'],
                      style: TextStyle(
                          fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE,
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
    );
  }
}
