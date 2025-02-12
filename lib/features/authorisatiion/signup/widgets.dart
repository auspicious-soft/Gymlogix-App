 
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/authorisatiion/login/pg_login.dart';
import 'package:gymlogix/features/base/presentation/providers/signup_provider.dart'; 

class BtnAlreadyHaveAcc extends StatelessWidget {
  const BtnAlreadyHaveAcc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Label(txt: "Already have an account?", type: TextTypes.f_12_500),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PgLogin()),
              );
            },
            child: const Label(
              txt: "Login",
              type: TextTypes.f_20_700,
              forceColor: Colors.red,
            ))
      ],
    );
  }
}

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

class FieldErrorTitle extends StatelessWidget {
  const FieldErrorTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Label(
            txt: "Minimum 6 characters",
            type: TextTypes.f_12_500,
            forceColor: AppColors.privacyTxt,
          ),
        ));
  }
}

class FieldSignUpPassword extends StatelessWidget {
 final SignUpFormState formState;
   const FieldSignUpPassword({
    super.key,
    required this.passwordController,
    required this.formState
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
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
              ? 'Password cannot be empty and  minimun 6 characters'
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

class FieldEmailSignUp extends StatelessWidget {
 final SignUpFormState formState;
   const FieldEmailSignUp({
    super.key,
    required this.emailController,
    required this.formState
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'Email Address',
          hintStyle: const TextStyle(
              color: AppColors.blackColor,
              fontFamily: AppConst.fontFamily,
              fontWeight: FontWeight.w500),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: formState.isEmailError
                  ? AppColors.red
                  : AppColors.blackColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: formState.isEmailError
                  ? AppColors.red
                  : AppColors.blackColor,
            ),
          ),
          errorText:
              formState.isEmailError ? 'Invalid email address' : null,
        ),
        style: const TextStyle(
            color: AppColors.blackColor,
            fontFamily: AppConst.fontFamily,
            fontWeight: FontWeight.w500),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

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

class SignupLoader extends StatelessWidget {
  const SignupLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Label(
              txt: "Signing Up....",
              type: TextTypes.f_20_900,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CircularProgressIndicator(
                value: 3,
                backgroundColor: Colors.grey,
                color: AppColors.primaryColor,
                // minHeight: 8,
              ),
            ),
          ],
        );
  }
}
