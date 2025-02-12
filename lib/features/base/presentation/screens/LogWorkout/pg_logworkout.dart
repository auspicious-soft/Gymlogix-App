import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/app_settings/constants/app_dim.dart';
import 'package:gymlogix/features/helpers/global_widgets/common_button.dart';
import 'package:gymlogix/features/base/presentation/screens/CreateExerciseStack/createexercise/pg_createexericse.dart';
import 'package:gymlogix/features/base/presentation/screens/SpecificExercise/pg_specific_exercise.dart';
import 'package:gymlogix/features/base/presentation/screens/WorkoutResult/pg_workoutresult.dart';

class PgLogworkout extends StatefulWidget {
  const PgLogworkout({super.key});

  @override
  State<PgLogworkout> createState() => _PgLogworkoutState();
}

class _PgLogworkoutState extends State<PgLogworkout> {
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
                            txt: "Workout",
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
                        Positioned(
                          bottom: 20,
                          left: 15,
                          right: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Label(
                                txt: 'PPL bulking',
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
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [
                        Row(children: [
                          SizedBox(
                            height: 61,
                            width: 61,
                            child: Image.asset(
                              AppAssets.leg,
                              fit: BoxFit.contain,
                            ),
                          ),
                          padHorizontal(10),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Label(
                                    txt: "Quadriceps",
                                    type: TextTypes.f_16_500),
                                Container(
                                  height: 21,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Align(
                                      alignment: Alignment.center,
                                      child: Label(
                                        txt: "20%",
                                        type: TextTypes.f_10_500,
                                        forceColor: AppColors.whiteColor,
                                      )),
                                )
                              ]),
                          padHorizontal(10),
                          SizedBox(
                            height: 61,
                            width: 61,
                            child: Image.asset(
                              AppAssets.leg,
                              fit: BoxFit.contain,
                            ),
                          ),
                          padHorizontal(10),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Label(
                                    txt: "Quadriceps",
                                    type: TextTypes.f_16_500),
                                Container(
                                  height: 21,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Align(
                                      alignment: Alignment.center,
                                      child: Label(
                                        txt: "20%",
                                        type: TextTypes.f_10_500,
                                        forceColor: AppColors.whiteColor,
                                      )),
                                )
                              ]),
                        ])
                      ])),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 45,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Label(
                                txt: "Exercise list",
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
                        GestureDetector(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PgSpecificExercise()),
                                  )
                                },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 84,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: AppColors.lightGrey),
                              ),
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
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Label(
                                        txt: "Smith machine shrug",
                                        type: TextTypes.f_15_500,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Label(
                                        txt: "3x4",
                                        type: TextTypes.f_15_500,
                                        forceColor: AppColors.grey,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                      AppAssets.workoutdot,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PgSpecificExercise()),
                                  )
                                },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 84,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: AppColors.lightGrey),
                              ),
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
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Label(
                                        txt: "Smith machine shrug",
                                        type: TextTypes.f_15_500,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Label(
                                        txt: "3x4",
                                        type: TextTypes.f_15_500,
                                        forceColor: AppColors.grey,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                      AppAssets.workoutdot,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PgCreateexericse()),
                            );
                          },
                          child: Align(
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
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 20,
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
                                  border:
                                      Border.all(color: AppColors.lightGrey),
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
                              const SizedBox(
                                height: 40,
                              ),
                              commonButton(
                                txt: "Finish Workout",
                                context: context,
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PgWorkoutresult()),
                                  )
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ]))
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 75,
                              // width: 168,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 222, 93, 123),
                                  borderRadius: BorderRadius.circular(45)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.asset(
                                      AppAssets.notetime,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Label(
                                          txt: "Workout",
                                          type: TextTypes.f_12_900,
                                          forceColor: AppColors.whiteColor,
                                        ),
                                        Label(
                                          txt: "43:00",
                                          type: TextTypes.f_16_500,
                                          forceColor: AppColors.whiteColor,
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                            Container(
                              height: 75,
                              // width: 168,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 222, 93, 123),
                                  borderRadius: BorderRadius.circular(45)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.asset(
                                      AppAssets.notetime,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Label(
                                          txt: "Exercise",
                                          type: TextTypes.f_12_900,
                                          forceColor: AppColors.whiteColor,
                                        ),
                                        Label(
                                          txt: "43:00",
                                          type: TextTypes.f_16_500,
                                          forceColor: AppColors.whiteColor,
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                          ]),
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
