import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/app_settings/constants/app_dim.dart';

class PgWorkoutresult extends StatefulWidget {
  const PgWorkoutresult({super.key});

  @override
  State<PgWorkoutresult> createState() => _PgWorkoutresultState();
}

class _PgWorkoutresultState extends State<PgWorkoutresult> {
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
                            txt: "Result",
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
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 130,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(45)),
                              child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Label(
                                      txt: "Duration",
                                      type: TextTypes.f_12_500,
                                    ),
                                    Label(
                                      txt: "00:00:00",
                                      type: TextTypes.f_20_500i,
                                      forceColor: AppColors.primaryColor,
                                    ),
                                    Label(
                                      txt: "00:00:12",
                                      type: TextTypes.f_12_500,
                                    ),
                                  ]),
                            ),
                            padHorizontal(20),
                            Container(
                              width: 130,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(45)),
                              child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Label(
                                      txt: "Volume",
                                      type: TextTypes.f_12_500,
                                    ),
                                    Label(
                                      txt: "5.3t",
                                      type: TextTypes.f_20_500i,
                                      forceColor: AppColors.primaryColor,
                                    ),
                                    Label(
                                      txt: "00:00:12",
                                      type: TextTypes.f_12_500,
                                    ),
                                  ]),
                            ),
                          ]),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 130,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(45)),
                              child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Label(
                                      txt: "Effort ",
                                      type: TextTypes.f_12_500,
                                    ),
                                    Label(
                                      txt: "13",
                                      type: TextTypes.f_20_500i,
                                      forceColor: AppColors.primaryColor,
                                    ),
                                    Label(
                                      txt: "1.4",
                                      type: TextTypes.f_12_500,
                                    ),
                                  ]),
                            ),
                            padHorizontal(20),
                            Container(
                              width: 130,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(45)),
                              child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Label(
                                      txt: "Distance(KM)",
                                      type: TextTypes.f_12_500,
                                    ),
                                    Label(
                                      txt: "13",
                                      type: TextTypes.f_20_500i,
                                      forceColor: AppColors.primaryColor,
                                    ),
                                    Label(
                                      txt: "1.4",
                                      type: TextTypes.f_12_500,
                                    ),
                                  ]),
                            ),
                          ]),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 130,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(45)),
                              child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Label(
                                      txt: "Sets",
                                      type: TextTypes.f_12_500,
                                    ),
                                    Label(
                                      txt: "13",
                                      type: TextTypes.f_20_500i,
                                      forceColor: AppColors.primaryColor,
                                    ),
                                    Label(
                                      txt: "1.4",
                                      type: TextTypes.f_12_500,
                                    ),
                                  ]),
                            ),
                            padHorizontal(20),
                            Container(
                              width: 130,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(45)),
                              child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Label(
                                      txt: "Reps",
                                      type: TextTypes.f_12_500,
                                    ),
                                    Label(
                                      txt: "13",
                                      type: TextTypes.f_20_500i,
                                      forceColor: AppColors.primaryColor,
                                    ),
                                    Label(
                                      txt: "1.4",
                                      type: TextTypes.f_12_500,
                                    ),
                                  ]),
                            ),
                          ]),
                    ])),
              ),
              const SizedBox(
                height: 30,
              ),
              const Label(
                txt: "BEST RECORD",
                type: TextTypes.f_20_900i,
                forceColor: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Label(
                          txt: "Highest Volume",
                          type: TextTypes.f_18_600,
                        )),
                    padVertical(10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.lightGrey),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Label(
                                txt: "Smith machine shrug",
                                type: TextTypes.f_15_700,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Label(
                                      txt: "3x4",
                                      type: TextTypes.f_15_900,
                                      forceColor: AppColors.grey,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Label(
                                      txt: "1. 46kg  10m  04’’00  x1",
                                      type: TextTypes.f_12_500,
                                      forceColor: AppColors.grey,
                                    ),
                                    Label(
                                      txt: "2. 46kg  10m  04’’00  x1",
                                      type: TextTypes.f_12_500,
                                      forceColor: AppColors.grey,
                                    ),
                                  ])
                            ],
                          ),
                        ],
                      ),
                    ),
                    padVertical(10),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Label(
                          txt: "Highest Distance",
                          type: TextTypes.f_18_600,
                        )),
                    padVertical(10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.lightGrey),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Label(
                                txt: "Smith machine shrug",
                                type: TextTypes.f_15_700,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Label(
                                      txt: "3x4",
                                      type: TextTypes.f_15_900,
                                      forceColor: AppColors.grey,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Label(
                                      txt: "1. 46kg  10m  04’’00  x1",
                                      type: TextTypes.f_12_500,
                                      forceColor: AppColors.grey,
                                    ),
                                    Label(
                                      txt: "2. 46kg  10m  04’’00  x1",
                                      type: TextTypes.f_12_500,
                                      forceColor: AppColors.grey,
                                    ),
                                  ])
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      height: 250,
                      width: 285,
                      child: Image.asset(
                        AppAssets.body2,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Label(
                            txt: "Comments",
                            type: TextTypes.f_15_700,
                            forceColor: AppColors.primaryColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            height: 103,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: AppColors.lightGrey),
                            ),
                            child: const TextField(
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                hintText: "Type a comment..",
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: AppConst.fontFamily),
                              textInputAction: TextInputAction.done,
                              maxLines: null,
                            ),
                          ),
                        ])),
                  ])),
              const SizedBox(
                height: 40,
              ),
            ],
          )))
        ],
      ),
    );
  }
}
