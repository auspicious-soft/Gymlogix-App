
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/authorisatiion/signup/pg_signup.dart';
import 'package:gymlogix/features/base/presentation/providers/login_provider.dart';
import 'package:gymlogix/features/base/presentation/screens/forgotpassword/pg_forgot_pass.dart';

 

class BtnGoogle extends StatelessWidget {
  const BtnGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      padding:
          const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: AppColors.blackColor),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(
              AppAssets.googleicon,
              fit: BoxFit.contain,
            ),
          ),
          const Label(
            txt: "Continue with Google",
            type: TextTypes.f_18_500,
            forceColor: AppColors.blackColor,
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}

class GymXLoader extends StatelessWidget {
  const GymXLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
            child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ));
  }
}
