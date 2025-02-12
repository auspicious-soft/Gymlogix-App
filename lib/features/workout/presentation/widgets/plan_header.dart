import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

class PlanPageHeader extends StatelessWidget {
  final String title;
  const PlanPageHeader({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
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
                    GestureDetector(
                      onTap: () => {Navigator.pop(context)},
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                      Label(
                      txt: title,
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
}
