import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gymlogix/Services/api_service.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/components/widget_global_margin.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_config.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/global_widgets/common_button.dart';
import 'package:flutter/gestures.dart';
import 'package:gymlogix/features/base/presentation/providers/signup_provider.dart';
import 'dart:async';
import 'package:gymlogix/features/base/presentation/screens/bestprograms/pg_bestprograms.dart';
import 'package:gymlogix/features/base/presentation/screens/login/pg_login.dart';

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

//                                   final isValid = !formState.isFirstNameError &&
//                                    !formState.isLastNameError &&
//                                     !formState.isEmailError &&
//                                       !formState.isPasswordError;
//  print(isValid);
//                                   if (isValid) {
    // ref
    //     .read(
    //         stateLoginNotifierProvider.notifier)
    //     .login(
    //       email: emailController.text,
    //       pass: passwordController.text,
    //       context: context,
    //       onSuccess: (fineData) {
    //         goToDasboard(fineData, context);
    //       },
    //     );
    //  onSignUp(context);
    // } else {
    //   ref
    //       .read(
    //           stateSignUpFormNotifierProvider.notifier)
    //       .validateForm(firstNameController.text, lastNameController.text,
    //        emailController.text, passwordController.text,confirmPasswordController.text);
    // }
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
        // Show loader
        // showDialog(
        //   context: context,
        //   barrierDismissible: false,
        //   builder: (BuildContext context) {
        //     return const Center(
        //       child: CircularProgressIndicator(
        //         color: AppColors.primaryColor,
        //       ),
        //     );
        //   },
        // );
      } else if (now.hasError) {
        print("In error");
        //
        // Show error message
        Flushbar(
          message: now.error.toString(),
          duration: const Duration(seconds: 2),
          flushbarStyle: FlushbarStyle.GROUNDED,
        ).show(context);
        // Navigator.pop(context);
      } else if (now.value!) {
        // Close loader
        // Navigator.pop(context);
        print("In Success");
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
        // .login(
        //   email: emailController.text,
        //   pass: passwordController.text,
        //   context: context,
        //   onSuccess: (fineData) {
        //     goToDasboard(fineData, context);
        //   },
        // );
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
                    loading: () => const Column(
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
                        ),
                    orElse: () =>
                        //Form here
                        signupBody(formState, context)
                    //form end,
                    // error: (error, stackTrace) {
                    //   return Container();
                    // },
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
        Container(
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
        ),
        const SizedBox(height: 50),
        const Label(
          txt: "Email sign up",
          type: TextTypes.f_20_700,
        ),
        const SizedBox(height: 40),

        Row(
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
        ),
        const SizedBox(height: 20),
        Padding(
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
        ),
        const SizedBox(height: 20),
        Padding(
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
        ),
        const Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Label(
                txt: "Minimum 6 characters",
                type: TextTypes.f_12_500,
                forceColor: AppColors.privacyTxt,
              ),
            )),
        //confirm password

        Padding(
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
        ),
        const Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Label(
                txt: "Minimum 6 characters",
                type: TextTypes.f_12_500,
                forceColor: AppColors.privacyTxt,
              ),
            )),
        const SizedBox(
          height: 20,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Label(txt: "Already have an account?", type: TextTypes.f_12_500),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PgLogin()),
                  );
                },
                child: Label(
                  txt: "Login",
                  type: TextTypes.f_20_700,
                  forceColor: Colors.red,
                ))
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                    'By continuing, you acknowledge and accept GymLogix\'s \n',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppConst.fontFamily,
                  color: Color.fromARGB(255, 79, 78, 78),
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
                      color: Color.fromARGB(255, 79, 78, 78),
                    ),
                  ),
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.red,
                      fontFamily: AppConst.fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("T&C !!");
                      },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> onSignUp(BuildContext context) async {
    const String endpoint = AppConfig.signUp;
    final String signupAt = DateTime.now().toUtc().toIso8601String();
    final String platform = Platform.isIOS ? "iOS" : "Android";

    final Map<String, dynamic> requestBody = {
      "google_id": "",
      "gender": "male",
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "age": 25,
      "locale": "en_US",
      "email": emailController.text,
      "password": passwordController.text,
      "password_confirmation": passwordController.text,
      "pic_URL": "https://example.com/pic.jpg",
      "signup_at": signupAt,
      "signin_at": signupAt,
      "platform": platform,
      "signup_type": "email",
      "device_id": "1234",
      "is_premium": true,
      "premium_expiration": null,
      "user_type": ""
    };

    // Show loader
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        );
      },
    );

    try {
      // Make the API call using ApiService
      final response = await ApiService.request(
        endpoint,
        method: 'POST',
        body: requestBody,
      );

      // Close loader
      Navigator.pop(context);

      if (response["status"] == 0) {
        Flushbar(
          message: "User created successfully!",
          backgroundColor: AppColors.green,
          duration: const Duration(seconds: 2),
          flushbarStyle: FlushbarStyle.GROUNDED,
        ).show(context);

        Future.delayed(const Duration(seconds: 2), () {
           
          Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(
    builder: (context) => PgLogin(),
  ),
  (Route<dynamic> route) => false,
);
        //  Navigator.pushAndRemoveUntil(context,   MaterialPageRoute(builder: (context) => const PgLogin()))
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const PgLogin()),
          // );
        });
      } else {
        // Show error message
        Flushbar(
          message: response['reason'] ?? "Signup failed. Please try again.",
          duration: const Duration(seconds: 2),
          flushbarStyle: FlushbarStyle.GROUNDED,
        ).show(context);
      }
    } catch (e) {
      // Close loader on error
      Navigator.pop(context);

      print('Exception during API call: $e');
      Flushbar(
        message: "An error occurred!",
        duration: const Duration(seconds: 2),
        flushbarStyle: FlushbarStyle.GROUNDED,
      ).show(context);
    }
  }
}
