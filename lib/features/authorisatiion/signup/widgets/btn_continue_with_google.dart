 
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart'; 
class BtnContinueWithGoogle extends StatelessWidget {
  const BtnContinueWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.blackColor),
      ),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(
              AppAssets.googleicon,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const Label(
          txt: "Continue with Google",
          type: TextTypes.f_18_500,
        ),
        const SizedBox(),
      ]),
    );
  }
}