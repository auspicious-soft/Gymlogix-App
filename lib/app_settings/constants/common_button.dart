import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

Widget commonButton(
    {VoidCallback? onPressed, String? txt, context, Color?  forceColor  ,TextTypes forceTextType = TextTypes.f_18_600 , double forceHeight =  60}) {
  return SizedBox(
      height: forceHeight,
      width: MediaQuery.of(context).size.width / 1.1,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: forceColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Label(
          txt: txt!,
          type: TextTypes.f_18_600,
          forceColor: AppColors.whiteColor,
        ),
      ));
}

Widget commonButton2({VoidCallback? onPressed, String? txt, context}) {
  return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width / 1.1,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: AppColors.loginBtn,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Label(
          txt: txt!,
          type: TextTypes.f_18_600,
          forceColor: AppColors.whiteColor,
        ),
      ));
}
