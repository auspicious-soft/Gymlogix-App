import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

class PgViewfood extends StatefulWidget {
  const PgViewfood({super.key});

  @override
  State<PgViewfood> createState() => _PgViewfoodState();
}

class _PgViewfoodState extends State<PgViewfood> {
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
                            AppAssets.rice,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 15,
                          right: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Label(
                                txt: 'Rice',
                                type: TextTypes.f_16_700,
                                forceColor: AppColors.whiteColor,
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 35,
                                width: 35,
                                child: Image.asset(
                                  AppAssets.edit,
                                  fit: BoxFit.contain,
                                ),
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
                      SizedBox(
                        height: 107,
                        width: 112,
                        child: Image.asset(
                          AppAssets.rice,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      SizedBox(
                        height: 107,
                        width: 112,
                        child: Image.asset(
                          AppAssets.rice,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      SizedBox(
                        height: 107,
                        width: 112,
                        child: Image.asset(
                          AppAssets.rice,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
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
                            txt: "Cooking instructions",
                            type: TextTypes.f_14_700,
                            forceColor: AppColors.primaryColor),
                        const SizedBox(height: 15),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Label(
                              txt: "Describe the exercise  in details",
                              type: TextTypes.f_14_500,
                            )),
                        const SizedBox(
                          height: 45,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Label(
                                txt: "Estimate Macros",
                                type: TextTypes.f_14_700,
                                forceColor: AppColors.primaryColor,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                height: 14,
                                width: 14,
                                child: Image.asset(
                                  AppAssets.help,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(children: [
                              const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Label(
                                      txt: "Calories",
                                      type: TextTypes.f_20_500,
                                    ),
                                    Label(
                                      txt: "1203",
                                      type: TextTypes.f_20_500,
                                    ),
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 1,
                                decoration: const BoxDecoration(
                                  color: AppColors.lightGrey,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [
                                      Label(
                                        txt: "10g",
                                        type: TextTypes.f_20_500,
                                      ),
                                      Label(
                                        txt: "Total Carbs",
                                        type: TextTypes.f_14_700,
                                        forceColor:
                                            Color.fromARGB(255, 147, 146, 146),
                                      ),
                                    ]),
                                    Column(children: [
                                      Label(
                                        txt: "10g",
                                        type: TextTypes.f_20_500,
                                      ),
                                      Label(
                                        txt: "Total Carbs",
                                        type: TextTypes.f_14_700,
                                        forceColor:
                                            Color.fromARGB(255, 147, 146, 146),
                                      ),
                                    ]),
                                    Column(children: [
                                      Label(
                                        txt: "10g",
                                        type: TextTypes.f_20_500,
                                      ),
                                      Label(
                                        txt: "Total Carbs",
                                        type: TextTypes.f_14_700,
                                        forceColor:
                                            Color.fromARGB(255, 147, 146, 146),
                                      ),
                                    ]),
                                  ]),
                            ]))
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
