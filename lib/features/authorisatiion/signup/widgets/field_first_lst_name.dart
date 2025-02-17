 
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/authorisatiion/login/pg_login.dart';
import 'package:gymlogix/features/base/presentation/providers/signup_provider.dart'; 

class FieldFirstAndLastName extends StatelessWidget {
  final SignUpFormState formState;
  const FieldFirstAndLastName({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.formState
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                hintText: 'First Name',
                hintStyle: const TextStyle(
                    color: AppColors.blackColor,
                    fontFamily: AppConst.fontFamily,
                    fontWeight: FontWeight.w500),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: formState.isFirstNameError
                        ? AppColors.red
                        : AppColors.blackColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: formState.isFirstNameError
                        ? AppColors.red
                        : AppColors.blackColor,
                  ),
                ),
                errorText: formState.isFirstNameError
                    ? 'First name cannot be empty'
                    : null,
              ),
              style: const TextStyle(
                  color: AppColors.blackColor,
                  fontFamily: AppConst.fontFamily,
                  fontWeight: FontWeight.w500),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: TextField(
            controller: lastNameController,
            decoration: InputDecoration(
              hintText: 'Last Name',
              hintStyle: const TextStyle(
                  color: AppColors.blackColor,
                  fontFamily: AppConst.fontFamily,
                  fontWeight: FontWeight.w500),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: formState.isLastNameError
                      ? AppColors.red
                      : AppColors.blackColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: formState.isLastNameError
                      ? AppColors.red
                      : AppColors.blackColor,
                ),
              ),
              errorText: formState.isLastNameError
                  ? 'Last name cannot be empty'
                  : null,
            ),
            style: const TextStyle(
                color: AppColors.blackColor,
                fontFamily: AppConst.fontFamily,
                fontWeight: FontWeight.w500),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
        )),
      ],
    );
  }
}
