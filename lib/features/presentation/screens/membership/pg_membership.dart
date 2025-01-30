import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/components/widget_global_margin.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';

class PgMembership extends StatefulWidget {
  const PgMembership({super.key});

  @override
  State<PgMembership> createState() => _PgMembershipState();
}

class _PgMembershipState extends State<PgMembership> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      AppAssets.background,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => {Navigator.pop(context)},
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Label(
                              txt: "Membership",
                              type: TextTypes.f_16_700,
                              forceColor: AppColors.whiteColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: Image.asset(
                            AppAssets.bellicon,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: WidgetGlobalMargin(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Label(
                          txt: "Membership Benefits", type: TextTypes.f_20_900),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: Image.asset(
                              AppAssets.memprogram,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Label(
                                  txt: "Access to all programs",
                                  type: TextTypes.f_14_700,
                                  forceColor: AppColors.primaryColor,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  child: const Label(
                                    txt:
                                        "Gain unlimited access to all workout and nutrition programs, tailored to your goals.",
                                    type: TextTypes.f_10_500,
                                    forceColor: AppColors.grey,
                                  ),
                                )
                              ]),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: Image.asset(
                              AppAssets.aiicon,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Label(
                                  txt: "AI Driven insight",
                                  type: TextTypes.f_14_700,
                                  forceColor: AppColors.primaryColor,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  child: const Label(
                                    txt:
                                        "Track progress smarter with AI-driven insights—review detailed summaries of past workouts to fine-tune your performance and reach your fitness goals faster.",
                                    type: TextTypes.f_10_500,
                                    forceColor: AppColors.grey,
                                  ),
                                )
                              ]),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: Image.asset(
                              AppAssets.expert,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Label(
                                  txt: "Expert Guidance",
                                  type: TextTypes.f_14_700,
                                  forceColor: AppColors.primaryColor,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  child: const Label(
                                    txt:
                                        "Get expert guidance on demand—receive personalized feedback from real trainers and ask questions to enhance your workout experience anytime.",
                                    type: TextTypes.f_10_500,
                                    forceColor: AppColors.grey,
                                  ),
                                )
                              ]),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: Image.asset(
                              AppAssets.metric,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Label(
                                  txt: "Advanced Meteric",
                                  type: TextTypes.f_14_700,
                                  forceColor: AppColors.primaryColor,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  child: const Label(
                                    txt:
                                        "Elevate your progress with in-depth metrics and detailed statistics, helping you analyze and optimize every aspect of your training.",
                                    type: TextTypes.f_10_500,
                                    forceColor: AppColors.grey,
                                  ),
                                )
                              ]),
                        ],
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            const Label(
              txt: "Cancel Anytime * Recurring Billing",
              type: TextTypes.f_12_700,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Label(
                txt:
                    "Your Google Play or iTunes account will be charged, and the membership will renew automatically. You can cancel at least 24 hours before the end of the billing period to prevent renewal.",
                type: TextTypes.f_10_500,
                forceAlignment: TextAlign.center,
                forceColor: AppColors.grey,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("privacy !!");
                        },
                      text: "Privacy Policy",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppConst.fontFamily,
                        color: Color.fromARGB(255, 79, 78, 78),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Terms of Use !!");
                        },
                      text: "Terms of Use",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppConst.fontFamily,
                        color: Color.fromARGB(255, 79, 78, 78),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
