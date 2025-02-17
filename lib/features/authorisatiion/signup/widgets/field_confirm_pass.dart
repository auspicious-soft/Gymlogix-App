 
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/authorisatiion/login/pg_login.dart';
import 'package:gymlogix/features/base/presentation/providers/signup_provider.dart'; 

class FieldConfirmPassword extends StatelessWidget {
final  SignUpFormState formState;
   const FieldConfirmPassword({
    super.key,
    required this.confirmPasswordController,
    required this.formState
  });

  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        controller: confirmPasswordController,
        decoration: InputDecoration(
          hintText: 'Confirm Password',
          hintStyle: const TextStyle(
              color: AppColors.blackColor,
              fontFamily: AppConst.fontFamily,
              fontWeight: FontWeight.w500),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: formState.isConfirmPasswordError
                  ? AppColors.red
                  : AppColors.blackColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: formState.isConfirmPasswordError
                  ? AppColors.red
                  : AppColors.blackColor,
            ),
          ),
          errorText: formState.isConfirmPasswordError
              ? 'Confirm Password cannot be empty and  minimun 6 characters'
              : null,
        ),
        style: const TextStyle(
            color: AppColors.blackColor,
            fontFamily: AppConst.fontFamily,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
