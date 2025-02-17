 
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/authorisatiion/login/pg_login.dart';
import 'package:gymlogix/features/base/presentation/providers/signup_provider.dart'; 

class ErrorTitle extends StatelessWidget {
  const ErrorTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Label(
            txt: "Minimum 6 characters",
            type: TextTypes.f_12_500,
            forceColor: AppColors.privacyTxt,
          ),
        ));
  }
}
