import 'package:flutter/material.dart';
import 'package:gymlogix/Pages/dashboard/pg_dashboard.dart';
import 'package:gymlogix/Pages/forgotpassword/pg_forgot_pass.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:flutter/gestures.dart';
import 'package:gymlogix/app_settings/constants/common_button.dart';

class PgLogin extends StatefulWidget {
  const PgLogin({super.key});

  @override
  State<PgLogin> createState() => _PgLoginState();
}

class _PgLoginState extends State<PgLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.backgroudimg,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Label(
                        txt: "Login to your GymLogix account",
                        type: TextTypes.f_32_900,
                      ),
                      const SizedBox(height: 40),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
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
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                AppAssets.googleicon,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const Label(
                              txt: "Continue with Google",
                              type: TextTypes.f_18_500,
                              forceColor: AppColors.blackColor,
                            ),
                            const SizedBox(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Label(
                        txt: "OR",
                        type: TextTypes.f_16_500,
                        forceColor: AppColors.privacyTxt,
                      ),
                      const SizedBox(height: 25),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                                color: AppColors.blackColor,
                                fontFamily: AppConst.fontFamily,
                                fontWeight: FontWeight.w500),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.blackColor),
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
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: AppColors.blackColor,
                                fontFamily: AppConst.fontFamily,
                                fontWeight: FontWeight.w500),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.blackColor),
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
                      const SizedBox(height: 40),
                      commonButton(
                        txt: "Login",
                        context: context,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PgDashBoard()),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PgForgotPass()),
                              );
                            },
                          text: 'Forgot Password?',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppConst.fontFamily,
                            color: AppColors.red,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                'By continuing, you acknowledge and accept GymLogix\'s \n',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppConst.fontFamily,
                              color: AppColors.privacyTxt,
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
                                  color: AppColors.privacyTxt,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.red,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppConst.fontFamily,
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
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
