import "package:flutter/material.dart";
import "package:gymlogix/app_settings/components/label.dart";
import "package:gymlogix/app_settings/constants/app_assets.dart";
import "package:gymlogix/app_settings/constants/app_colors.dart";

Widget commonHeader(BuildContext context, String title) {
  return Container(
    height: 120,
    decoration: const BoxDecoration(
      color: AppColors.primaryColor,
    ),
    child: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            AppAssets.background,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  Label(
                    txt: title!,
                    type: TextTypes.f_16_700,
                    forceColor: AppColors.whiteColor,
                  ),
                ],
              ),
              SizedBox(
                height: 35,
                width: 35,
                child: Image.asset(
                  AppAssets.bellicon,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
