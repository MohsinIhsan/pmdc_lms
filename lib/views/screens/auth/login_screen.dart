import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmdc_lms/services/login_service.dart';
import 'package:pmdc_lms/utils/app_colors.dart';
import 'package:pmdc_lms/utils/app_constants.dart';
import 'package:pmdc_lms/utils/app_dimensions.dart';
import 'package:pmdc_lms/views/screens/dashboard/dashboard_screen.dart';
import 'widget/background.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String id = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? selectedCampus;
  // late List campusList;

  bool invalidCredentials = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool loginIndicator = false;
  bool loginSuccess = false;
  var connectivityResult;

  checkInternetConnection() async {
    // connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   // connected to a mobile network.
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    //   // connected to a wifi network.
    // } else {
    //   setState(() {
    //     loginIndicator = false;
    //   });
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text(
    //     'Please Check your internet connection!',
    //     textAlign: TextAlign.center,
    //   )));
    // }
  }

  late bool loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/logo1.png",
                  height: size.height * 0.18,
                ),
                SizedBox(height: size.height * 0.07),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 29, vertical: 9.0),
                  child: DropdownButton(
                    items: AppConstants.campusList?.map(
                      (list) {
                        return DropdownMenuItem(
                          child: Column(
                            children: [
                              Text(list['campusName']),
                              Divider(
                                color: AppColors.orange1,
                              ),
                            ],
                          ),
                          value: list['campusid'],
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCampus = value.toString();
                        print(value);
                        AppConstants.campusid = value.toString();
                      });
                    },
                    value: selectedCampus,
                    hint: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 14.0, left: 8.0),
                          child: Icon(
                            Icons.school,
                            color: Colors.black45,
                          ),
                        ),
                        Text('Select Campus'),
                      ],
                    ),
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: idController,
                              decoration: InputDecoration(
                                fillColor: Colors.transparent,
                                filled: true,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(5),
                                  ),
                                ),
                                labelText: 'Registration Number',
                                prefixIcon: const Icon(Icons.person),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return 'Please enter your Registration ID';
                                }
                                if (value.trim().length < 4) {
                                  return 'Registration ID must be minimum 4 digits';
                                }
                                // Return null if the entered email is valid
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                fillColor: Colors.transparent,
                                filled: true,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(5),
                                  ),
                                ),
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                labelText: 'Password',
                              ),
                              obscureText: !_passwordVisible,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return 'Please enter your password';
                                }
                                // Return null if the entered email is valid
                                return null;
                              },
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //     right: 15.0,
                          //     top: 4.0,
                          //   ),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       InkWell(
                          //         child: const Text(
                          //           'Forgot Password?',
                          //           style: TextStyle(color: AppColors.primary),
                          //         ),
                          //         onTap: () {
                          //
                          //         },
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(height: 40.h),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 26.0, vertical: 18),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.orange2.withOpacity(0.7),
                                    AppColors.primary.withOpacity(0.8),
                                    AppColors.orange2.withOpacity(0.7),
                                  ],
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  final FormState? formStateVal =
                                      _formKey.currentState;
                                  if (formStateVal!.validate()) {
                                    if (AppConstants.campusid == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              duration: Duration(seconds: 2),
                                              backgroundColor:
                                                  AppColors.primary,
                                              content: Text(
                                                'Select your Campus first',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: AppDimensions
                                                        .FONT_SIZE_LARGE),
                                              )));
                                    } else {
                                      setState(() {
                                        loginIndicator = true;
                                      });
                                      LoginService()
                                          .login(
                                              idController, passwordController)
                                          .then((value) => setState(() {
                                                print(value);
                                                print(value['status']);
                                                if (value['status'] == 'true') {
                                                  invalidCredentials = false;
                                                  loginIndicator = false;
                                                  AppConstants.regNo =
                                                      idController.text;
                                                  Navigator.of(context)
                                                      .pushReplacementNamed(
                                                          DashboardScreen.id);
                                                } else if (value['status'] ==
                                                    'false') {
                                                  // invalidCredentials = true;
                                                  loginIndicator = false;
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          duration: Duration(
                                                              seconds: 2),
                                                          backgroundColor:
                                                              AppColors.primary,
                                                          content: Text(
                                                            'Wrong Credentials',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    AppDimensions
                                                                        .FONT_SIZE_LARGE),
                                                          )));
                                                } else {
                                                  loginIndicator = false;
                                                  print('Some error occurred');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          duration: Duration(
                                                              seconds: 2),
                                                          backgroundColor:
                                                              AppColors.primary,
                                                          content: Text(
                                                            'Some error occurred',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    AppDimensions
                                                                        .FONT_SIZE_LARGE),
                                                          )));
                                                }
                                              }));

                                      checkInternetConnection();
                                    }
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                        letterSpacing: 1.5,
                                        fontSize: AppDimensions.FONT_SIZE_LARGE,
                                      ),
                                    ),
                                    loginIndicator
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: CupertinoActivityIndicator(
                                              color: AppColors.white,
                                              radius: 15,
                                            ),
                                          )
                                        : const SizedBox(
                                            height: 0,
                                            width: 0,
                                          )
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shape: StadiumBorder(),
                                  elevation: 0,
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  minimumSize: Size(double.infinity, 51),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'For any query email us at ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'culms@cusit.edu.pk',
                                  style:
                                      const TextStyle(color: AppColors.primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // SendEmailService.sendEmail();
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
