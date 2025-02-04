import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
 
 
class BtnMorePlan extends StatelessWidget {
  const BtnMorePlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      height: 22,
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Label(
            txt: "More Plan",
            type: TextTypes.f_14_500,
            forceColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
