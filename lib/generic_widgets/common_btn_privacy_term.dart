
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'; 
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
 
class CommonBtnPrivacyTerm extends StatelessWidget {
  const CommonBtnPrivacyTerm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10.0),
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
    );
  }
}
