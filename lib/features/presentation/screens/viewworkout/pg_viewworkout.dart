import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

class PgViewworkout extends StatefulWidget {
  const PgViewworkout({super.key});

  @override
  State<PgViewworkout> createState() => _PgViewworkoutState();
}

class _PgViewworkoutState extends State<PgViewworkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
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
                  padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
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
                            txt: "Custome workout plan",
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 221,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            AppAssets.program,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Positioned(
                          bottom: 20,
                          left: 15,
                          right: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Label(
                                txt: 'Squats',
                                type: TextTypes.f_16_700,
                                forceColor: AppColors.whiteColor,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: AppColors.primaryColor, size: 30),
                                  Icon(Icons.star,
                                      color: AppColors.primaryColor, size: 30),
                                  Icon(Icons.star_border,
                                      color: AppColors.primaryColor, size: 30),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 139,
                          child: Image.asset(
                            AppAssets.program,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 139,
                          child: Image.asset(
                            AppAssets.program,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 139,
                          child: Image.asset(
                            AppAssets.program,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const Label(
                            txt: "Descriptions",
                            type: TextTypes.f_14_700,
                            forceColor: AppColors.primaryColor),
                        const SizedBox(height: 15),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Label(
                              txt: "Describe the exercise  in details",
                              type: TextTypes.f_14_500,
                            )),
                        const SizedBox(height: 40),
                        const Label(
                            txt: "Instructions",
                            type: TextTypes.f_14_700,
                            forceColor: AppColors.primaryColor),
                        const SizedBox(height: 15),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Label(
                              txt: "Describe the exercise  in details",
                              type: TextTypes.f_14_500,
                            )),
                        const SizedBox(height: 40),
                        const Label(
                            txt: "Preparation",
                            type: TextTypes.f_14_700,
                            forceColor: AppColors.primaryColor),
                        const SizedBox(height: 15),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Label(
                              txt: "Describe the exercise  in details",
                              type: TextTypes.f_14_500,
                            )),
                        const SizedBox(height: 40),
                        const Label(
                            txt: "Execution",
                            type: TextTypes.f_14_700,
                            forceColor: AppColors.primaryColor),
                        const SizedBox(height: 15),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Label(
                              txt: "Describe the exercise  in details",
                              type: TextTypes.f_14_500,
                            )),
                        const SizedBox(height: 40),
                        const Label(
                            txt: "Mechanics",
                            type: TextTypes.f_14_700,
                            forceColor: AppColors.primaryColor),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 64,
                          width: 90,
                          child: Image.asset(
                            AppAssets.mechanic,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Label(
                          txt: "Compound",
                          type: TextTypes.f_14_700,
                        ),
                        const SizedBox(height: 40),
                        const Label(
                            txt: "Muslce Targets",
                            type: TextTypes.f_14_700,
                            forceColor: AppColors.primaryColor),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 302,
                          child: Image.asset(
                            AppAssets.body2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 280,
                          child: Image.asset(
                            AppAssets.body2,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Label(
                                  txt: "Mechanics",
                                  type: TextTypes.f_14_700,
                                  forceColor: AppColors.primaryColor,
                                ),
                                Container(
                                  height: 30,
                                  width: 120,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: AppColors.primaryColor)),
                                  child: const Align(
                                      alignment: Alignment.center,
                                      child: Label(
                                        txt: "Strength",
                                        type: TextTypes.f_15_900,
                                      )),
                                )
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Label(
                                  txt: "Equipment",
                                  type: TextTypes.f_14_700,
                                  forceColor: AppColors.primaryColor,
                                ),
                                Container(
                                  height: 30,
                                  width: 120,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: AppColors.primaryColor)),
                                  child: const Align(
                                      alignment: Alignment.center,
                                      child: Label(
                                        txt: "Strength",
                                        type: TextTypes.f_15_900,
                                      )),
                                )
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Label(
                                  txt: "Force",
                                  type: TextTypes.f_14_700,
                                  forceColor: AppColors.primaryColor,
                                ),
                                Container(
                                  height: 30,
                                  width: 120,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: AppColors.primaryColor)),
                                  child: const Align(
                                      alignment: Alignment.center,
                                      child: Label(
                                        txt: "Strength",
                                        type: TextTypes.f_15_900,
                                      )),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
