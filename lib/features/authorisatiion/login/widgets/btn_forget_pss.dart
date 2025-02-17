
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/base/presentation/screens/forgotpassword/pg_forgot_pass.dart'; 
class BtnForgetPassword extends StatelessWidget {
  const BtnForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const PgForgotPass()),
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
    );
  }
}
