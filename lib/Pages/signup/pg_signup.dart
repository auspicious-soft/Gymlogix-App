import 'package:flutter/material.dart';
import 'package:gymlogix/Pages/bestprograms/pg_bestprograms.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/components/widget_global_margin.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/app_settings/constants/common_button.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';

class PgSignup extends StatefulWidget {
  const PgSignup({super.key});

  @override
  State<PgSignup> createState() => _PgSignupState();
}

class _PgSignupState extends State<PgSignup> {
  bool isLoading = false;
  double progressValue = 0.0;
  Timer? timer;

  void startLoading() {
    setState(() {
      isLoading = true;
      progressValue = 0.0;
    });

    timer = Timer.periodic(const Duration(milliseconds: 200), (Timer timer) {
      setState(() {
        if (progressValue < 1.0) {
          progressValue += 0.1;
        } else {
          timer.cancel();
          isLoading = false;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PgBestprograms()));
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: Stack(children: [
        if (isLoading)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Label(
                  txt: "Searching for the best plan",
                  type: TextTypes.f_20_900,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: Colors.grey,
                    color: AppColors.primaryColor,
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          ),
        if (!isLoading)
          SingleChildScrollView(
            child: WidgetGlobalMargin(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Label(
                    txt: 'Sign up and start your training',
                    type: TextTypes.f_32_900,
                  ),
                  const SizedBox(height: 55),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.blackColor),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                AppAssets.googleicon,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const Label(
                            txt: "Continue with Google",
                            type: TextTypes.f_18_500,
                          ),
                          const SizedBox(),
                        ]),
                  ),
                  const SizedBox(height: 50),
                  const Label(
                    txt: "Email sign up",
                    type: TextTypes.f_20_700,
                  ),
                  const SizedBox(height: 40),
                  const Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                  color: AppColors.blackColor,
                                  fontFamily: AppConst.fontFamily,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.red),
                              ),
                            ),
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontFamily: AppConst.fontFamily,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: TextStyle(
                                  color: AppColors.blackColor,
                                  fontFamily: AppConst.fontFamily,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.red),
                              ),
                            ),
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontFamily: AppConst.fontFamily,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: AppConst.fontFamily,
                            fontWeight: FontWeight.w500),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.blackColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.red),
                        ),
                      ),
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppConst.fontFamily,
                          fontWeight: FontWeight.w500),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: AppConst.fontFamily,
                            fontWeight: FontWeight.w500),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.blackColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.red),
                        ),
                      ),
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppConst.fontFamily,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Label(
                          txt: "Minimum 6 characters",
                          type: TextTypes.f_12_500,
                          forceColor: AppColors.privacyTxt,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: commonButton(
                          onPressed: () => {
                                startLoading(),
                              },
                          txt: "Sign up",
                          context: context)),
                  const SizedBox(height: 10),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text:
                              'By continuing, you acknowledge and accept GymLogix\'s \n',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConst.fontFamily,
                            color: Color.fromARGB(255, 79, 78, 78),
                          ),
                          children: [
                            TextSpan(
                              text: 'privacy policy',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.red,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppConst.fontFamily,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("privacy !!");
                                },
                            ),
                            const TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppConst.fontFamily,
                                color: Color.fromARGB(255, 79, 78, 78),
                              ),
                            ),
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.red,
                                fontFamily: AppConst.fontFamily,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("T&C !!");
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ])),
    );
  }
}
