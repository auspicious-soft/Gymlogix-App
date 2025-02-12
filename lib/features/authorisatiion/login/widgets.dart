
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/authorisatiion/signup/pg_signup.dart';
import 'package:gymlogix/features/base/presentation/providers/login_provider.dart';
import 'package:gymlogix/features/base/presentation/screens/forgotpassword/pg_forgot_pass.dart';

class BtnPrivacyAndTerm extends StatelessWidget {
  const BtnPrivacyAndTerm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text:
              'By continuing, you acknowledge and accept GymLogix\'s \n',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: AppConst.fontFamily,
            color: AppColors.privacyTxt,
          ),
          children: [
            TextSpan(
              text: 'privacy policy',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.red,
                fontWeight: FontWeight.bold,
                fontFamily: AppConst.fontFamily,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print("privacy !!");
                },
            ),
            const TextSpan(
              text: ' and ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: AppConst.fontFamily,
                color: AppColors.privacyTxt,
              ),
            ),
            TextSpan(
              text: 'Terms & Conditions',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.red,
                fontWeight: FontWeight.bold,
                fontFamily: AppConst.fontFamily,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print("T&C !!");
                },
            ),
          ],
        ),
      ),
    );
  }
}

class BtnAlreadyHaveAnAccount extends StatelessWidget {
  const BtnAlreadyHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row
    
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const Label(txt: "Already have an account?", type: TextTypes.f_12_500),
    
      TextButton(onPressed: (){
                          
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const PgSignup()),
              // );
                Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const  PgSignup(),
      ),
      (Route<dynamic> route) => false,
    );
            
            
      }, child: const Label(txt: "SignUp", type: TextTypes.f_20_700,forceColor: Colors.red,))
    ],);
  }
}

class BtnForgetPassword extends StatelessWidget {
  const BtnForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const PgForgotPass()),
            );
          },
        text: 'Forgot Password?',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: AppConst.fontFamily,
          color: AppColors.red,
        ),
      ),
    );
  }
}

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

class FieldEmail extends StatelessWidget {
  const FieldEmail({
    super.key,
    required this.emailController,
    required this.formState,
  });

  final TextEditingController emailController;
  final LoginFormState formState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 15),
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
          errorText: formState.isEmailError
              ? 'Invalid email address'
              : null,
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
