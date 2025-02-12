import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:flutter/gestures.dart';
import 'package:gymlogix/features/global_widgets/common_button.dart';
import 'package:gymlogix/extensions/extend_string.dart';
import 'package:gymlogix/features/base/data/datasources/user_storage.dart';
import 'package:gymlogix/features/base/data/models/login_model.dart';
import 'package:gymlogix/features/base/presentation/providers/login_provider.dart';
import 'package:gymlogix/features/base/presentation/screens/dashboard/pg_dashboard.dart';
import 'package:gymlogix/features/base/presentation/screens/forgotpassword/pg_forgot_pass.dart';
import 'package:gymlogix/features/base/presentation/screens/signup/pg_signup.dart';


class PgLogin extends ConsumerStatefulWidget {
  const PgLogin({super.key});

  @override
  PgLoginState createState() => PgLoginState();
}

class PgLoginState extends ConsumerState<PgLogin> {
  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
   // ref.read(counterProvider);
  }

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
// return Container();


//   }}
// class PgLogin extends ConsumerWidget {
//   const PgLogin({super.key});

  @override
  Widget build(BuildContext context ) {

    final formState = ref.watch(loginFormNotifierProvider);
    final loginState = ref.watch(stateLoginNotifierProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (loginState.hasError) {
        Flushbar(
          message: loginState.error.toString(),
          duration: const Duration(seconds: 2),
          flushbarStyle: FlushbarStyle.GROUNDED,
        ).show(context); 
        // Reset the error state to avoid showing the error repeatedly
       // ref.read(stateLoginNotifierProvider.notifier);
      }
    });
//print("Widget call ${emailController.text}");
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.backgroudimg,
              fit: BoxFit.cover,
            ),
          ),


          loginState.maybeWhen(
              loading: () => const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )),
              orElse: () => SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Label(
                                txt: "Login to your GymLogix account",
                                type: TextTypes.f_32_900,
                              ),
                              const SizedBox(height: 40),
                              Container(
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
                              ),
                              const SizedBox(height: 30),
                              const Label(
                                txt: "OR",
                                type: TextTypes.f_16_500,
                                forceColor: AppColors.privacyTxt,
                              ),
                              const SizedBox(height: 25),
                              Padding(
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
                              ),
                              const SizedBox(height: 20),
                              Padding(
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
                              ),
                              const SizedBox(height: 40),
                              commonButton(
                                txt: "Login",
                                context: context,
                                onPressed: () {
                                  
                                  final isValid = !formState.isEmailError &&
                                      !formState.isPasswordError &&
                                      emailController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty && !emailController.text.isInvalidEmail();
print(isValid);
                                  if (isValid) {
                                    ref
                                        .read(
                                            stateLoginNotifierProvider.notifier)
                                        .login(
                                          email: emailController.text,
                                          pass: passwordController.text,
                                          context: context,
                                          onSuccess: (fineData) {
                                            goToDasboard(fineData, context);
                                          },
                                        );
                                  } else {
                                    ref
                                        .read(
                                            loginFormNotifierProvider.notifier)
                                        .validateForm(emailController.text,
                                            passwordController.text);
                                  }
                                },
                              ),
                              const SizedBox(height: 30),
                              RichText(
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
                              ),
                             // const SizedBox(height: 30),
                              Row
                              
                              (
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Label(txt: "Already have an account?", type: TextTypes.f_12_500),

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
        
        
                                }, child: Label(txt: "SignUp", type: TextTypes.f_20_700,forceColor: Colors.red,))
                              ],),
                              Padding(
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
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
//       Positioned(
//   top: 60,
//   left: 20,
//   child:IconButton(onPressed: (){
    
//     Navigator.pop(context);
//   }, icon: const Icon(Icons.arrow_back_rounded,color: Colors.white,size: 50,)),
// ),
      
        ],
      ),
    );
  }

  void goToDasboard(LoginModel fineData, BuildContext context) async {
    print(fineData);
    await UserStorage.con.saveToken(fineData.token);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const PgDashBoard()),
    );
  }
  // void loginUser(BuildContext context) async {
  //   // Show loading dialog
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return const Center(
  //         child: CircularProgressIndicator(
  //           color: AppColors.primaryColor,
  //         ),
  //       );
  //     },
  //   );

  //   try {
  //     // Make the API call
  //     final response = await ApiService.request(
  //       AppConfig.signIn,
  //       method: 'POST',
  //       body: {
  //         'email': emailController.text,
  //         'password': passwordController.text,
  //       },
  //     );

  //     Navigator.pop(context);

  //     if (response['status'] == 0) {
  //       // Parse the response using the UserModel
  //       final user = UserModel.fromJson(response);

  //       // Save user data securely
  //       await secureStorage.write(key: 'token', value: user.token);
  //       await secureStorage.write(key: 'user', value: jsonEncode(user.user));

  //       // Show success message
  //       Flushbar(
  //         message: "Login successful!",
  //         backgroundColor: AppColors.green,
  //         duration: const Duration(seconds: 2),
  //         flushbarStyle: FlushbarStyle.GROUNDED,
  //       ).show(context);

  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const PgDashBoard()),
  //       );

  //       print('Login response: $response');
  //     } else {
  //       Flushbar(
  //         message: "Login failed. Please try again.",
  //         duration: const Duration(seconds: 2),
  //         flushbarStyle: FlushbarStyle.GROUNDED,
  //       ).show(context);
  //     }
  //   } catch (e) {
  //     Navigator.pop(context);

  //     // Show error message
  //     Flushbar(
  //       message: "Error logging in: $e",
  //       duration: const Duration(seconds: 2),
  //       flushbarStyle: FlushbarStyle.GROUNDED,
  //     ).show(context);
  //     print('Error logging in: $e');
  //   }
  // }
}
