
import 'package:flutter/material.dart';

import '../../../../app_settings/constants/app_colors.dart';
import '../../../../app_settings/constants/app_const.dart';
import '../../../base/presentation/providers/login_provider.dart';

class FieldPassword extends StatelessWidget {
  const FieldPassword({
    super.key,
    required this.passwordController,
    required this.formState,
  });

  final TextEditingController passwordController;
  final LoginFormState formState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: passwordController,
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: const TextStyle(
              color: AppColors.blackColor,
              fontFamily: AppConst.fontFamily,
              fontWeight: FontWeight.w500),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: formState.isPasswordError
                  ? AppColors.red
                  : AppColors.blackColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: formState.isPasswordError
                  ? AppColors.red
                  : AppColors.blackColor,
            ),
          ),
          errorText: formState.isPasswordError
              ? 'Password cannot be empty'
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
