import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:flutter/gestures.dart';
import 'package:gymlogix/app_settings/constants/common_button.dart';

class PgForgotPass extends StatefulWidget {
  const PgForgotPass({super.key});

  @override
  State<PgForgotPass> createState() => _PgForgotPassState();
}

class _PgForgotPassState extends State<PgForgotPass> {
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Label(
                      txt: "Forgot your password?",
                      type: TextTypes.f_32_900,
                    )),
                const SizedBox(
                  height: 70,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
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
                  height: 50,
                ),
                commonButton(
                    onPressed: () => {}, txt: "Submit", context: context),
                const SizedBox(
                  height: 70,
                ),
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
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
