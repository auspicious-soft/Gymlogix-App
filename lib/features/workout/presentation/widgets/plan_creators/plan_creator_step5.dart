
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

class PlanCreatorStep5 extends StatelessWidget {
  const PlanCreatorStep5({
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
              txt: "Number of days in a week",
              type: TextTypes.f_14_700,
              forceColor: AppColors.primaryColor,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 70, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Label(
                      txt: "-",
                      type: TextTypes.f_40_700,
                    ),
                    Label(
                      txt: "3",
                      type: TextTypes.f_40_700,
                    ),
                    Label(
                      txt: "+",
                      type: TextTypes.f_40_700,
                    ),
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            const Label(
              txt: "Duration of the program",
              type: TextTypes.f_14_700,
              forceColor: AppColors.primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 36,
              width: 36,
              child: Image.asset(
                AppAssets.calender,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ));
  }
}
