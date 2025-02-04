import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';

import '../../../../../app_settings/constants/app_colors.dart';

Container buildWorkoutHeader(String title,Function(String) onClickHeader) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        height: 40,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
        ),
        child:   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Label(
                txt: title,
                type: TextTypes.f_16_700,
                forceColor: AppColors.whiteColor),
            TextButton(
              onPressed: () {
                onClickHeader(title);
              },
              child: Label(
                  txt: "-",
                  type: TextTypes.f_18_600,
                  forceColor: AppColors.whiteColor),
            ),
          ],
        ),
      );
  }
