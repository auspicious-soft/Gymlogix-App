
import 'package:flutter/material.dart'; 
import 'package:gymlogix/app_settings/constants/app_colors.dart';

import '../../../../../app_settings/components/label.dart';
import '../../../../../app_settings/constants/app_assets.dart';
 
class PlanCreatorStep3 extends StatelessWidget {
  const PlanCreatorStep3({
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
              txt: "Select the location  of your program",
              type: TextTypes.f_14_700,
              forceColor: AppColors.primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: Image.asset(
                        AppAssets.gym,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Label(
                      txt: "GYM",
                      type: TextTypes.f_14_700,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: Image.asset(
                        AppAssets.home,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Label(
                      txt: "HOME",
                      type: TextTypes.f_14_700,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: Image.asset(
                        AppAssets.outdoor,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Label(
                      txt: "OUTDOOR",
                      type: TextTypes.f_14_700,
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
