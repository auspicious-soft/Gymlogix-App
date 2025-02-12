import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:gymlogix/features/base/presentation/screens/CreateExerciseStack/AddExercise/pg_addexercise.dart';

class PgAddExDays extends StatefulWidget {
  const PgAddExDays({super.key});

  @override
  State<PgAddExDays> createState() => _PgAddExDaysState();
}

class _PgAddExDaysState extends State<PgAddExDays> {
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
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: 176,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.grey,
              ),
              child: Stack(
                children: [
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
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 37,
                    width: 151,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: AppColors.pink2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Label(
                          txt: "Day 1",
                          type: TextTypes.f_16_700,
                          forceColor: AppColors.whiteColor,
                        ),
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset(
                            AppAssets.edit,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(
              height: 70,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Label(
                  txt: "Exercises",
                  type: TextTypes.f_14_700,
                  forceColor: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.help,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: GestureDetector(
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PgAddexercise()),
                          )
                        },
                    child: DottedBorder(
                      color: const Color.fromRGBO(147, 141, 141, 1),
                      strokeWidth: 1,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(15),
                      dashPattern: const [6, 3],
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 61,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: Color.fromRGBO(147, 141, 141, 1),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Please add exercises",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(147, 141, 141, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))),
            const SizedBox(
              height: 60,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Label(
                  txt: "Rest period",
                  type: TextTypes.f_14_700,
                  forceColor: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.help,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Label(
                              txt: "-",
                              type: TextTypes.f_40_700,
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Label(
                                    txt: "3",
                                    type: TextTypes.f_40_700,
                                  ),
                                  Label(
                                    txt: "DAYS",
                                    type: TextTypes.f_15_700,
                                  )
                                ]),
                            Label(
                              txt: "+",
                              type: TextTypes.f_40_700,
                            ),
                          ],
                        )),
                  ],
                )),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Label(
                  txt: "Visual Label",
                  type: TextTypes.f_14_700,
                  forceColor: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.help,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.pink2,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.begni,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.blue,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.skyblue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.lightgreen,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.gardengreen,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.mustad,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.orange,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.yellow,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ])
        ])));
  }
}
