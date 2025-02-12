import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/features/helpers/global_widgets/common_button.dart';

class PgLogmeasurement extends StatefulWidget {
  const PgLogmeasurement({super.key});

  @override
  State<PgLogmeasurement> createState() => _PgLogmeasurementState();
}

class _PgLogmeasurementState extends State<PgLogmeasurement> {
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
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Label(
                            txt: "Adding Measurements",
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
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 222, 93, 123),
                              borderRadius: BorderRadius.circular(45),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    AppAssets.notecal,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Label(
                                      txt: "Date",
                                      type: TextTypes.f_12_900,
                                      forceColor: AppColors.whiteColor,
                                    ),
                                    Label(
                                      txt: "Today",
                                      type: TextTypes.f_16_500,
                                      forceColor: AppColors.whiteColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 75,
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 222, 93, 123),
                              borderRadius: BorderRadius.circular(45),
                            ),
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
                                const SizedBox(width: 10),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Label(
                                      txt: "Time",
                                      type: TextTypes.f_12_900,
                                      forceColor: AppColors.whiteColor,
                                    ),
                                    Label(
                                      txt: "Now",
                                      type: TextTypes.f_16_500,
                                      forceColor: AppColors.whiteColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Label(
                        txt: "Measurements",
                        type: TextTypes.f_15_700,
                        forceColor: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(
                          AppAssets.help,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(
                          txt: "ARM",
                          type: TextTypes.f_18_500,
                        ),
                        Label(
                          txt: "13",
                          type: TextTypes.f_18_500,
                        ),
                        Label(
                          txt: "CM",
                          type: TextTypes.f_18_500,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 58,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: AppColors.lightGrey),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Label(
                              txt: "Waste",
                              type: TextTypes.f_18_500,
                            ),
                          ),
                        ),
                        Container(
                          height: 58,
                          width: 140,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: AppColors.lightGrey),
                          ),
                        ),
                        Container(
                          height: 58,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: AppColors.lightGrey),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Label(
                              txt: "CM",
                              type: TextTypes.f_18_500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 30,
                        width: 74,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.primaryColor,
                          border: Border.all(color: AppColors.lightGrey),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Label(
                            txt: "Add",
                            type: TextTypes.f_15_500,
                            forceColor: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Label(
                        txt: "Comments",
                        type: TextTypes.f_15_700,
                        forceColor: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(
                          AppAssets.help,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 106,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.lightGrey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  commonButton(
                    context: context,
                    txt: "Log Measurements",
                    onPressed: () => {},
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
