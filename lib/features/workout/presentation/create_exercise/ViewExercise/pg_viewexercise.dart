import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

import 'package:gymlogix/generic_widgets/common_button.dart';
import 'package:gymlogix/features/workout/presentation/providers/exercise_provider.dart';

class PgViewExercise extends ConsumerStatefulWidget {
  const PgViewExercise({super.key});

  @override
  ConsumerState<PgViewExercise> createState() => _PgViewexerciseState();
}

class _PgViewexerciseState extends ConsumerState<PgViewExercise> {
  int selectedIndex = 1; // Default selected index
  final List<String> percentages = ["0%", "10%", "20%"]; // Picker items
@override
  void initState() {
   print("At Page view");
    super.initState();
  }
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
                            txt: "Exercise",
                            type: TextTypes.f_16_700,
                            forceColor: AppColors.whiteColor,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => {Navigator.pop(context)},
                        child: SizedBox(
                          height: 35,
                          width: 35,
                          child: Image.asset(
                            AppAssets.done,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
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
                        Positioned(
                          bottom: 20,
                          left: 15,
                          right: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Label(
                                txt: 'Barbel Squat',
                                type: TextTypes.f_16_700,
                                forceColor: AppColors.whiteColor,
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  AppAssets.info,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Label(
                      txt: "Timing",
                      type: TextTypes.f_15_700,
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
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Label(
                              txt: "Warm up set",
                              type: TextTypes.f_15_700,
                            ),
                            Label(
                              txt: "Auto",
                              type: TextTypes.f_16_500,
                            ),
                          ])),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Label(
                              txt: "Warm up set",
                              type: TextTypes.f_15_700,
                            ),
                            Label(
                              txt: "Auto",
                              type: TextTypes.f_16_500,
                            ),
                          ])),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Label(
                              txt: "Warm up set",
                              type: TextTypes.f_15_700,
                            ),
                            Label(
                              txt: "Auto",
                              type: TextTypes.f_16_500,
                            ),
                          ])),
                  const SizedBox(height: 30),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Label(
                      txt: "Mode",
                      type: TextTypes.f_15_700,
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
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 35,
                                width: 35,
                                child: Image.asset(
                                  AppAssets.time,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Label(
                                txt: "Time",
                                type: TextTypes.f_14_500,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 35,
                                width: 35,
                                child: Image.asset(
                                  AppAssets.weight,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Label(
                                txt: "Weight",
                                type: TextTypes.f_14_500,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 35,
                                width: 35,
                                child: Image.asset(
                                  AppAssets.distance,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Label(
                                txt: "Distance",
                                type: TextTypes.f_14_500,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 45,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Label(
                                txt: "Alternative Exercise",
                                type: TextTypes.f_15_700,
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
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    height: 55,
                                    width: 55,
                                    child: Image.asset(
                                      AppAssets.program,
                                      fit: BoxFit.contain,
                                    ),
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Label(
                                    txt: "Squat",
                                    type: TextTypes.f_15_500,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.8,
                                    child: const Label(
                                      txt:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                      type: TextTypes.f_10_500,
                                      forceColor: AppColors.grey,
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.info,
                                size: 20,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 30,
                              width: 74,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Align(
                                  alignment: Alignment.center,
                                  child: Label(
                                    txt: "Add",
                                    type: TextTypes.f_15_500,
                                    forceColor: AppColors.whiteColor,
                                  )),
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(children: [
                              const SizedBox(
                                height: 40,
                              ),
                              commonButton(
                                txt: "Add",
                                context: context,
                                onPressed: () => {},
                              ),
                              const SizedBox(
                                height: 30,
                              ),
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
