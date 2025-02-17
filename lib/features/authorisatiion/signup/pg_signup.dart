 
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; 
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/components/widget_global_margin.dart'; 
import 'package:gymlogix/app_settings/constants/app_colors.dart'; 
import 'package:gymlogix/app_settings/constants/app_dim.dart';
import   'package:gymlogix/generic_widgets/common_btn_privacy_term.dart'; 
import 'package:gymlogix/generic_widgets/common_button.dart'; 
import 'package:gymlogix/features/base/presentation/providers/signup_provider.dart';
import 'dart:async';
import 'package:gymlogix/features/base/presentation/screens/bestprograms/pg_bestprograms.dart';
import 'package:gymlogix/features/authorisatiion/login/pg_login.dart';

import 'widgets/btn_already_have_acc.dart';
import 'widgets/btn_continue_with_google.dart';
import 'widgets/error_title.dart';
import 'widgets/field_confirm_pass.dart';
import 'widgets/field_email.dart';
import 'widgets/field_first_lst_name.dart';
import 'widgets/field_password.dart';
import 'widgets/signup_loader.dart';

class PgSignup extends ConsumerStatefulWidget {
  const PgSignup({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PgSignupState();
  }
}

class _PgSignupState extends ConsumerState<PgSignup> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  // bool isEmailError = false;
  // bool isPasswordError = false;
  // bool isNameError = false;
  // bool isLastError = false;
  bool isLoading = false;
  double progressValue = 0.0;
  Timer? timer;

  void startLoading() {
    setState(() {
      isLoading = true;
      progressValue = 0.0;
    });

    timer = Timer.periodic(const Duration(milliseconds: 200), (Timer timer) {
      setState(() {
        if (progressValue < 1.0) {
          progressValue += 0.1;
        } else {
          timer.cancel();
          isLoading = false;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PgBestprograms()));
        }
      });
    });
  }

  void onPressSignUp(SignUpFormState formState) {
    ref.read(stateSignUpFormNotifierProvider.notifier).validateForm(
        firstNameController.text,
        lastNameController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text);
 
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(stateSignUpFormNotifierProvider);
    final signUpState = ref.watch(stateSignUpNotifierProvider);
    ref.listen(stateSignUpNotifierProvider, (prev, now) {
      if (now.isLoading) {
        print("In Loading");
        
      } else if (now.hasError) { 
        //
        // Show error message
        Flushbar(
          message: now.error.toString(),
          duration: const Duration(seconds: 2),
          flushbarStyle: FlushbarStyle.GROUNDED,
        ).show(context);
        // Navigator.pop(context);
      } else if (now.value!) { 
        Flushbar(
          message: "User created successfully!",
          backgroundColor: AppColors.green,
          duration: const Duration(seconds: 2),
          flushbarStyle: FlushbarStyle.GROUNDED,
        ).show(context);

        Future.delayed(const Duration(seconds: 2), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PgLogin()),
          );
        });

        //
      }
    });
    ref.listen(stateSignUpFormNotifierProvider, (prev, now) {
      print("listen ${now.isValid}");
      if (now.isValid) {
        // onSignUp(context);
        ref.read(stateSignUpNotifierProvider.notifier).signUp(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            pass: passwordController.text,
            onSuccess: (fineData) {},
            context: context);
         
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (signUpState.hasError) {
        Flushbar(
          message: signUpState.error.toString(),
          duration: const Duration(seconds: 2),
          flushbarStyle: FlushbarStyle.GROUNDED,
        ).show(context);
        // Reset the error state to avoid showing the error repeatedly
        // ref.read(stateLoginNotifierProvider.notifier);
      }
    });
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: Stack(children: [
        if (isLoading)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Label(
                  txt: "Searching for the best plan",
                  type: TextTypes.f_20_900,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: Colors.grey,
                    color: AppColors.primaryColor,
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          ),

        //if (!isLoading)
        SingleChildScrollView(
          child: WidgetGlobalMargin(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Label(
                  txt: 'Sign up and start your training',
                  type: TextTypes.f_32_900,
                ),
                const SizedBox(height: 55),
                signUpState.maybeWhen(
                    loading: () => const SignupLoader(),
                    orElse: () =>
                        //Form here
                        signupBody(formState, context)
                    //form end,
                     
                    ),
              ],
            ),
          ),
        )
      ])),
    );
  }

  Column signupBody(SignUpFormState formState, BuildContext context) {
    return Column(
      children: [
        //Google login
        const BtnContinueWithGoogle(),
        padVertical(50),
        const Label(
          txt: "Email sign up",
          type: TextTypes.f_20_700,
        ),
       padVertical(40),

        FieldFirstAndLastName(firstNameController: firstNameController, lastNameController: lastNameController,formState:   formState),
        padVertical(20),
        FieldEmailSignUp(emailController: emailController,formState: formState),
        const SizedBox(height: 20),
        FieldSignUpPassword(passwordController: passwordController,formState: formState),
        const ErrorTitle(),
        //confirm password

        FieldConfirmPassword(confirmPasswordController: confirmPasswordController,formState: formState),
        const ErrorTitle(),
        padVertical(
         20,
        ),

        SizedBox(
            width: double.infinity,
            child: commonButton(
                onPressed: () {
                  onPressSignUp(formState);
                },
                txt: "Sign up",
                context: context)),
        const SizedBox(height: 10),
        // const SizedBox(height: 30),
        const BtnAlreadyHaveAcc(),
        const CommonBtnPrivacyTerm()
        
      ],
    );
  }

  
}
