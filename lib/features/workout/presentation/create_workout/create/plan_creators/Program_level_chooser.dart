import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

class ProgramLevelChooser extends StatelessWidget {
  const ProgramLevelChooser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15, vertical: 15),
        child: Column(
          children: [
            const Label(
              txt: "Difficulty of your program",
              type: TextTypes.f_14_700,
              forceColor: AppColors.primaryColor,
            ),
            SizedBox(
              height: 60,
              width: 100,
              child: Image.asset(
                AppAssets.rating,
                // fit: BoxFit.contain,
              ),
            ),
            const Label(
              txt: "Beginner",
              type: TextTypes.f_14_700,
            ),
          ],
        ));
  }
}
