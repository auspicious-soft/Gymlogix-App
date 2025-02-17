import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_dim.dart';
import 'package:gymlogix/features/authorisatiion/login/widgets/btn_forget_pss.dart';
import 'package:gymlogix/features/authorisatiion/login/widgets/field_email.dart';
import 'package:gymlogix/generic_widgets/common_button.dart';
import 'package:gymlogix/extensions/extend_string.dart';
import 'package:gymlogix/features/base/data/datasources/user_storage.dart';
import 'package:gymlogix/features/base/data/models/login_model.dart';
import 'package:gymlogix/features/base/presentation/providers/login_provider.dart';
import 'package:gymlogix/features/base/presentation/screens/dashboard/pg_dashboard.dart';
import 'package:gymlogix/generic_widgets/pos_background.dart';
import 'widgets/btn_google.dart';
import 'widgets/btn_already_hav_acc.dart';
import '../../../generic_widgets/common_btn_privacy_term.dart';
import 'widgets/field_password.dart';

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

  @override
  Widget build(BuildContext context) {
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
          const PositionBackGround(),
          loginState.maybeWhen(
              loading: () => const GymXLoader(),
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
                              padVertical(40),
                              const BtnGoogle(),
                              padVertical(30),
                              const Label(
                                txt: "OR",
                                type: TextTypes.f_16_500,
                                forceColor: AppColors.privacyTxt,
                              ),
                              padVertical(25),
                              FieldEmail(
                                  emailController: emailController,
                                  formState: formState),
                              padVertical(20),
                              FieldPassword(
                                  passwordController: passwordController,
                                  formState: formState),
                              padVertical(40),
                              commonButton(
                                txt: "Login",
                                context: context,
                                onPressed: () {
                                  final isValid = !formState.isEmailError &&
                                      !formState.isPasswordError &&
                                      emailController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty &&
                                      !emailController.text.isInvalidEmail();
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
                              padVertical(30),
                              const BtnForgetPassword(),
                              // const SizedBox(height: 30),
                              const BtnAlreadyHaveAnAccount(),
                              const CommonBtnPrivacyTerm(),
                              padVertical(40),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
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
}
