import 'package:flutter/material.dart';
import 'package:gymlogix/Pages/CreateExerciseStack/AddExerciseDays/pg_add_ex_days.dart';

import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

import 'package:dotted_border/dotted_border.dart';

class PgAddfood extends StatefulWidget {
  const PgAddfood({super.key});

  @override
  State<PgAddfood> createState() => _PgAddfoodState();
}

class _PgAddfoodState extends State<PgAddfood> {
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
              height: 40,
            ),
            const Label(
              txt: "Meals",
              type: TextTypes.f_14_700,
              forceColor: AppColors.primaryColor,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
                child: GestureDetector(
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PgAddExDays()),
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
                              "Add workout",
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
            const Label(
              txt: "Description",
              type: TextTypes.f_14_700,
              forceColor: AppColors.primaryColor,
            ),
            const Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: (Label(
                      txt: "This is the description of the program",
                      type: TextTypes.f_12_500i,
                      forceColor: AppColors.privacyTxt,
                    )))),
            const SizedBox(
              height: 20,
            ),
            const Label(
              txt: "Instructions",
              type: TextTypes.f_14_700,
              forceColor: AppColors.primaryColor,
            ),
            const Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: (Label(
                      txt: "This is the insturation of the program",
                      type: TextTypes.f_12_500i,
                      forceColor: AppColors.privacyTxt,
                    )))),
          ])
        ])));
  }
}
