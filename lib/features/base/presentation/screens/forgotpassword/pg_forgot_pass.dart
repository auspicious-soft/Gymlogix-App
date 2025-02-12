import 'package:flutter/material.dart';
import 'package:gymlogix/Services/api_service.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_config.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:flutter/gestures.dart';
import 'package:gymlogix/app_settings/constants/app_dim.dart';
import 'package:gymlogix/features/helpers/global_widgets/common_button.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:gymlogix/features/authorisatiion/login/pg_login.dart';

class PgForgotPass extends StatefulWidget {
  const PgForgotPass({super.key});

  @override
  State<PgForgotPass> createState() => _PgForgotPassState();
}

class _PgForgotPassState extends State<PgForgotPass> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController conPassController = TextEditingController();
  bool isEmailError = false;
  bool isCodeError = false;
  bool isPassError = false;
  bool isConfirmError = false;
  void onPressSubmit() {
    setState(() {
      isEmailError = emailController.text.isEmpty ||
          !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(emailController.text);

      if (!isEmailError) {
        onForgetPress(context);
      }
    });
  }

  void onVerifyPress() {
    setState(() {
      isCodeError = codeController.text.isEmpty;

      if (!isCodeError) {
        setState(() {
          selectedIndex = 2;
        });
      }
    });
  }

  void onResetPress() {
    setState(() {
      isPassError = passController.text.isEmpty ||
          passController.text != conPassController.text;
      isConfirmError = conPassController.text.isEmpty ||
          passController.text != conPassController.text;
    });
    if (!isPassError && !isConfirmError) {
      onResetPass(context);
    }
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.backgroudimg,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (selectedIndex == 0)
                  Column(children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Label(
                          txt: "Forget your password",
                          type: TextTypes.f_32_900,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    if (isEmailError)
                      Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(
                              0.4), // Semi-transparent black background
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                            child: Label(
                          txt: 'Invalid email address',
                          type: TextTypes.f_16_500,
                          forceColor: AppColors.red,
                        )),
                      ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
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
                              color: isEmailError
                                  ? AppColors.red
                                  : AppColors.blackColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: isEmailError
                                  ? AppColors.red
                                  : AppColors.blackColor,
                            ),
                          ),
                          // errorText: isEmailError ? 'Invalid email address' : null,
                        ),
                        style: const TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: AppConst.fontFamily,
                            fontWeight: FontWeight.w500),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    commonButton(
                        onPressed: () => {onPressSubmit()},
                        txt: "Submit",
                        context: context),
                    const SizedBox(
                      height: 70,
                    ),
                  ]),
                if (selectedIndex == 1)
                  Column(children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Label(
                          txt: "Verify your account",
                          type: TextTypes.f_32_900,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    if (isCodeError)
                      Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(
                              0.4), // Semi-transparent black background
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                            child: Label(
                          txt: 'Invalid verificatiopn code',
                          type: TextTypes.f_16_500,
                          forceColor: AppColors.red,
                        )),
                      ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: codeController,
                        decoration: InputDecoration(
                          hintText: 'Enter the code',
                          hintStyle: const TextStyle(
                              color: AppColors.blackColor,
                              fontFamily: AppConst.fontFamily,
                              fontWeight: FontWeight.w500),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: isCodeError
                                  ? AppColors.red
                                  : AppColors.blackColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: isCodeError
                                  ? AppColors.red
                                  : AppColors.blackColor,
                            ),
                          ),
                          // errorText: isEmailError ? 'Invalid email address' : null,
                        ),
                        style: const TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: AppConst.fontFamily,
                            fontWeight: FontWeight.w500),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    commonButton(
                        onPressed: () => {onVerifyPress()},
                        txt: "Verify",
                        context: context),
                    const SizedBox(
                      height: 70,
                    ),
                  ]),
                if (selectedIndex == 2)
                  Column(children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Label(
                          txt: "Reset your password",
                          type: TextTypes.f_32_900,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    if (isPassError || isConfirmError)
                      Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(
                              0.4), // Semi-transparent black background
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                            child: Label(
                          txt: 'Passwords must match and cannot be empty',
                          type: TextTypes.f_14_500,
                          forceColor: AppColors.red,
                        )),
                      ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: passController,
                        decoration: InputDecoration(
                          hintText: 'New Password',
                          hintStyle: const TextStyle(
                              color: AppColors.blackColor,
                              fontFamily: AppConst.fontFamily,
                              fontWeight: FontWeight.w500),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: isPassError
                                  ? AppColors.red
                                  : AppColors.blackColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: isPassError
                                  ? AppColors.red
                                  : AppColors.blackColor,
                            ),
                          ),
                          // errorText: isEmailError ? 'Invalid email address' : null,
                        ),
                        style: const TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: AppConst.fontFamily,
                            fontWeight: FontWeight.w500),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    padVertical(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: conPassController,
                        decoration: InputDecoration(
                          hintText: 'Repeat Password',
                          hintStyle: const TextStyle(
                              color: AppColors.blackColor,
                              fontFamily: AppConst.fontFamily,
                              fontWeight: FontWeight.w500),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: isConfirmError
                                  ? AppColors.red
                                  : AppColors.blackColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: isConfirmError
                                  ? AppColors.red
                                  : AppColors.blackColor,
                            ),
                          ),
                          // errorText: isEmailError ? 'Invalid email address' : null,
                        ),
                        style: const TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: AppConst.fontFamily,
                            fontWeight: FontWeight.w500),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    commonButton(
                        onPressed: () => {onResetPress()},
                        txt: "Reset Password",
                        context: context),
                    const SizedBox(
                      height: 70,
                    ),
                  ]),
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
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onForgetPress(BuildContext context) async {
    final Map<String, dynamic> requestBody = {
      "email": emailController.text.trim(),
    };

    showLoadingDialog(context);

    try {
      // Make API call using ApiService
      final response = await ApiService.request(
        AppConfig.forgotPass,
        method: 'POST',
        body: requestBody,
      );

      // Close loader
      Navigator.pop(context);

      // Check API response
      if (response['status'] == 0) {
        setState(() {
          selectedIndex = 1;
        });
        print('Password reset link sent successfully: $response');
        Flushbar(
          message: "Password reset link sent!",
          backgroundColor: AppColors.green,
          duration: const Duration(seconds: 2),
          flushbarStyle: FlushbarStyle.GROUNDED,
        ).show(context);
      } else {
        print('API Error: ${response['reason']}');
        Flushbar(
          message: response['reason'] ?? "Something went wrong!",
          duration: const Duration(seconds: 2),
          flushbarStyle: FlushbarStyle.GROUNDED,
        ).show(context);
      }
    } catch (e) {
      // Close loader
      Navigator.pop(context);
      print('Exception during API call: $e');
      Flushbar(
        message: "An error occurred. Please try again!",
        duration: const Duration(seconds: 2),
        flushbarStyle: FlushbarStyle.GROUNDED,
      ).show(context);
    }
  }

  Future<void> onResetPass(BuildContext context) async {
    final Map<String, dynamic> requestBody = {
      "email": emailController.text.trim(),
      "token": codeController.text,
      "password": passController.text,
      "password_confirmation": conPassController.text
    };

    showLoadingDialog(context);

    try {
      // Make API call using ApiService
      final response = await ApiService.request(
        AppConfig.resetPass,
        method: 'POST',
        body: requestBody,
      );

      // Close loader
      Navigator.pop(context);

      // Check API response
      if (response['status'] == 0) {
        print('$response');
        Flushbar(
          message: "Password reset successfully",
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
      } else {
        print('API Error: ${response['reason']}');
        Flushbar(
          message: response['reason'] ?? "Something went wrong!",
          duration: const Duration(seconds: 2),
          flushbarStyle: FlushbarStyle.GROUNDED,
        ).show(context);
      }
    } catch (e) {
      // Close loader
      Navigator.pop(context);
      print('Exception during API call: $e');

      String errorMessage = e.toString();
      if (errorMessage.contains("Invalid token provided")) {
        errorMessage = "Invalid token provided. Please check and try again.";
      } else {
        errorMessage = "An error occurred. Please try again!";
      }

      Flushbar(
        message: errorMessage,
        duration: const Duration(seconds: 2),
        flushbarStyle: FlushbarStyle.GROUNDED,
      ).show(context);
    }
  }

  /// Reusable loading dialog
  void showLoadingDialog(BuildContext context) {
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
  }
}
