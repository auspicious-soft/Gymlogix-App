import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/features/global_widgets/common_button.dart';
import 'package:gymlogix/features/base/presentation/screens/LogWorkout/pg_logworkout.dart';

class PgCreateworkoutlog extends StatefulWidget {
  const PgCreateworkoutlog({super.key});

  @override
  State<PgCreateworkoutlog> createState() => _PgCreateworkoutlogState();
}

class _PgCreateworkoutlogState extends State<PgCreateworkoutlog> {
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
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 222, 93, 123),
                              borderRadius: BorderRadius.circular(45)),
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
                              const SizedBox(
                                width: 10,
                              ),
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
                                  ]),
                            ],
                          ),
                        ),
                        Container(
                          height: 75,
                          // width: 168,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 222, 93, 123),
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
                                  ]),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Label(
                txt: "Plan",
                type: TextTypes.f_18_600,
                forceColor: AppColors.primaryColor,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton<String>(
                        value: null,
                        isExpanded: true,
                        hint: const Center(
                          child: Label(
                            txt: "PPL bulking",
                            type: TextTypes.f_16_700,
                          ),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        underline: const SizedBox(),
                        onChanged: (String? newValue) {},
                        items: <String>['Option 1', 'Option 2', 'Option 3']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(
                                child:
                                    Text(value)), // Center text in the dropdown
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Label(
                txt: "Meal",
                type: TextTypes.f_18_600,
                forceColor: AppColors.primaryColor,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton<String>(
                        value: null,
                        isExpanded: true,
                        hint: const Center(
                          child: Label(
                            txt: "Meal 1",
                            type: TextTypes.f_16_700,
                          ),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        underline: const SizedBox(),
                        onChanged: (String? newValue) {},
                        items: <String>['Option 1', 'Option 2', 'Option 3']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(child: Text(value)),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              commonButton(
                context: context,
                txt: "Start Wokrout",
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PgLogworkout()),
                  )
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
