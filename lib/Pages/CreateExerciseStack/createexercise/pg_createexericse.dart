import 'package:flutter/material.dart';
import 'package:gymlogix/Pages/CreateExerciseStack/AddWorkout/pg_addworkout.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/common_button.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';

class PgCreateexericse extends StatefulWidget {
  const PgCreateexericse({super.key});

  @override
  State<PgCreateexericse> createState() => _PgCreateexericseState();
}

class _PgCreateexericseState extends State<PgCreateexericse> {
  int? activeIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
            child: Column(children: [
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
                            txt: "Custom workout plan",
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                height: 176,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.grey,
                ),
                child: Stack(
                  children: [
                    const Align(
                        alignment: Alignment.topCenter,
                        child: Label(
                          txt: "Start building your program",
                          type: TextTypes.f_20_900i,
                          forceColor: AppColors.whiteColor,
                        )),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Label(
                            txt: "PPL Bulking",
                            type: TextTypes.f_16_700,
                            forceColor: AppColors.whiteColor,
                          ),
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
              const SizedBox(
                height: 60,
              ),
              if (activeIndex == 0)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: [
                      const Label(
                        txt: "Give a meanigull name for your program",
                        type: TextTypes.f_14_700,
                        forceColor: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        height: 54,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColors.lightGrey),
                        ),
                        child: const TextField(
                          textAlignVertical: TextAlignVertical.top,
                          decoration: InputDecoration(
                            hintText: "Type  name for your program",
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontFamily: AppConst.fontFamily),
                          textInputAction: TextInputAction.done,
                          maxLines: null,
                        ),
                      )
                    ])),
              if (activeIndex == 1)
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        const Label(
                          txt: "Select the goals of your program",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 40,
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
                                    AppAssets.mucle,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Hypertrophy",
                                  type: TextTypes.f_14_700,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: Image.asset(
                                    AppAssets.strength,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Strength",
                                  type: TextTypes.f_14_700,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
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
                                    AppAssets.edurance,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Endurance",
                                  type: TextTypes.f_14_700,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: Image.asset(
                                    AppAssets.cycle,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Cardio",
                                  type: TextTypes.f_14_700,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
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
                                    AppAssets.enhance,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Flexibility",
                                  type: TextTypes.f_14_700,
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
                                    AppAssets.milestone,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Functional",
                                  type: TextTypes.f_14_700,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )),
              if (activeIndex == 2)
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        const Label(
                          txt: "Select the location  of your program",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        SizedBox(
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
                                    AppAssets.gym,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "GYM",
                                  type: TextTypes.f_14_700,
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
                                    AppAssets.home,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "HOME",
                                  type: TextTypes.f_14_700,
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
                                    AppAssets.outdoor,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "OUTDOOR",
                                  type: TextTypes.f_14_700,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
              if (activeIndex == 3)
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        const Label(
                          txt: "Descripe the program in details",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          height: 120,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.lightGrey),
                          ),
                          child: const TextField(
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              hintText: "Type a detail",
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
                        const SizedBox(
                          height: 30,
                        ),
                        const Label(
                          txt: "Instruction and tips for the program",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          height: 120,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.lightGrey),
                          ),
                          child: const TextField(
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              hintText: "Type a detail",
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
                      ],
                    )),
              if (activeIndex == 4)
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        const Label(
                          txt: "Number of days in a week",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 70, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Label(
                                  txt: "-",
                                  type: TextTypes.f_40_700,
                                ),
                                Label(
                                  txt: "3",
                                  type: TextTypes.f_40_700,
                                ),
                                Label(
                                  txt: "+",
                                  type: TextTypes.f_40_700,
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        const Label(
                          txt: "Duration of the program",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Image.asset(
                            AppAssets.calender,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    )),
              if (activeIndex == 5)
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        const Label(
                          txt: "Difficulty of your program",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 60,
                          width: 100,
                          child: Image.asset(
                            AppAssets.rating,
                            // fit: BoxFit.contain,
                          ),
                        ),
                        const Label(
                          txt: "Beginner",
                          type: TextTypes.f_14_700,
                        ),
                      ],
                    )),
              SizedBox(height: 90),
              commonButton(
                txt: "Next",
                context: context,
                onPressed: () => {
                  if (activeIndex == 0)
                    {
                      setState(() {
                        activeIndex = 1;
                      })
                    }
                  else if (activeIndex == 1)
                    {
                      setState(() {
                        activeIndex = 2;
                      })
                    }
                  else if (activeIndex == 2)
                    {
                      setState(() {
                        activeIndex = 3;
                      })
                    }
                  else if (activeIndex == 3)
                    {
                      setState(() {
                        activeIndex = 4;
                      })
                    }
                  else if (activeIndex == 4)
                    {
                      setState(() {
                        activeIndex = 5;
                      })
                    }
                  else
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PgAddworkout()),
                      )
                    }
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ])));
  }
}
