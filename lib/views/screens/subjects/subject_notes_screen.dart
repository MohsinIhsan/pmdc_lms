import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmdc_lms/services/notes_service.dart';
import 'package:pmdc_lms/utils/app_colors.dart';
import 'package:pmdc_lms/utils/app_constants.dart';
import 'package:pmdc_lms/utils/app_dimensions.dart';
import 'package:pmdc_lms/views/basewidgets/shimmer_effect.dart';
import 'dart:io' show Platform;

import 'package:webview_flutter/webview_flutter.dart';

class SubjectNotesScreen extends StatefulWidget {
  static const String id = 'notes_screen';

  final String subject;
  final String isUrdu;

  const SubjectNotesScreen({
    Key? key,
    required this.subject,
    required this.isUrdu,
  }) : super(key: key);

  @override
  State<SubjectNotesScreen> createState() => _SubjectNotesScreenState();
}

class _SubjectNotesScreenState extends State<SubjectNotesScreen> {
  late bool loading;
  late List notesList;

  getNotes() async {
    await NotesService().notes(widget.subject).then((value) => setState(() {
          print(value);
          List<dynamic> dataList = value['Notes'];
          notesList = dataList;
          print(notesList);
          loading = false;
        }));
  }

  @override
  void initState() {
    super.initState();
    loading = true;
    getNotes();
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
          'Notes',
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
                                      "Session: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                          fontSize:
                                              AppDimensions.FONT_SIZE_LARGE),
                                    ),
                                  ),
                                  Text(
                                    AppConstants.session!,
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
                    itemCount: notesList.length,
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
                            title: Column(
                              children: [
                                Text(
                                  "Chapter Name",
                                  style: TextStyle(
                                      fontSize: AppDimensions.FONT_SIZE_LARGE,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black_light),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  notesList[index]['ChapterName'],
                                  style: TextStyle(
                                      fontSize: AppDimensions.FONT_SIZE_LARGE,
                                      color: AppColors.black_light),
                                  textAlign: TextAlign.center,
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
                                      "Chapter No : " +
                                          notesList[index]['ChapterNo'],
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
                                      "Description : " +
                                          notesList[index]['Description'],
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.FONT_SIZE_LARGE,
                                          color: AppColors.black),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: AppColors.orange1,
                                    ),
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
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NotesWebView(
                                                      notesLink:
                                                          notesList[index]
                                                              ['Link'],
                                                    )));
                                      },
                                      child: Text(
                                        'Download',
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

class NotesWebView extends StatefulWidget {
  String notesLink;
  NotesWebView({Key? key, required this.notesLink}) : super(key: key);

  @override
  State<NotesWebView> createState() => _NotesWebViewState();
}

class _NotesWebViewState extends State<NotesWebView> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    if (Platform.isIOS) WebView.platform = CupertinoWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.black_light,
        title: Text(
          'Notes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            child: WebView(
              initialUrl: "${widget.notesLink}",
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
          ),
          isLoading
              ? Center(
                  child: CupertinoActivityIndicator(
                    radius: 15,
                  ),
                )
              : Stack(),
        ],
      ),
    );
  }
}
