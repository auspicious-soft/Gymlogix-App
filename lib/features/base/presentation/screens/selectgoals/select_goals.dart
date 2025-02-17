import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/components/widget_global_margin.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/generic_widgets/common_button.dart';
import 'package:gymlogix/features/authorisatiion/signup/pg_signup.dart';

class PgSelectGoals extends StatefulWidget {
  const PgSelectGoals({super.key});

  @override
  State<PgSelectGoals> createState() => _PgSelectGoalsState();
}

class _PgSelectGoalsState extends State<PgSelectGoals> {
  final List<Map<String, String>> options = [
    {
      "title": "Increase Strength",
      "icon": AppAssets.strength,
    },
    {
      "title": "Improve Endurance",
      "icon": AppAssets.edurance,
    },
    {
      "title": "Lose Weight",
      "icon": AppAssets.cycle,
    },
    {
      "title": "Build Muscle Mass",
      "icon": AppAssets.mucle,
    },
    {
      "title": "Enhance Flexibility",
      "icon": AppAssets.enhance,
    },
    {
      "title": "Fitness Milestone",
      "icon": AppAssets.milestone,
    },
  ];

  final List<Map<String, String>> levels = [
    {
      "title": "Learning basics, building consistency",
      "icon": AppAssets.star,
    },
    {
      "title": "Regular training focused on progression",
      "icon": AppAssets.star2,
    },
    {
      "title": "Skilled, goal-driven,high intensity",
      "icon": AppAssets.star3,
    },
  ];

  final List<Map<String, String>> trainingop = [
    {
      "title": "Gym",
      "icon": AppAssets.gym,
    },
    {
      "title": "Home",
      "icon": AppAssets.home,
    },
    {
      "title": "Outdoor",
      "icon": AppAssets.outdoor,
    },
  ];
  int? selectedIndex;
  int? selectedLevels;
  int? selectedTrain;
  int? activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(children: [
            WidgetGlobalMargin(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Label(
                    txt: activeIndex == 0
                        ? 'Select your goal'
                        : activeIndex == 1
                            ? 'Describe your training level'
                            : "Where you like to train?",
                    type: TextTypes.f_32_900,
                  ),
                  const SizedBox(height: 40),
                  if (activeIndex == 0)
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          final item = options[index];
                          return GestureDetector(
                              onTap: () => {
                                    setState(() {
                                      selectedIndex = index;
                                    })
                                  },
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    height: 65,
                                    decoration: BoxDecoration(
                                      color: selectedIndex == index
                                          ? AppColors.lightblue
                                          : AppColors.lightGrey,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: selectedIndex == index
                                              ? AppColors.primaryColor
                                              : AppColors.lightGrey),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              height: 35,
                                              width: 35,
                                              child: Image.asset(
                                                item['icon']!,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.6,
                                            child: Label(
                                                txt: item['title'] ?? "",
                                                type: TextTypes.f_22_500),
                                          ),
                                          Icon(Icons.check,
                                              size: 30,
                                              color: selectedIndex == index
                                                  ? AppColors.green
                                                  : AppColors.lightGrey)
                                        ]),
                                  )));
                        },
                      ),
                    ),
                  if (activeIndex == 1)
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: levels.length,
                        itemBuilder: (context, index) {
                          final item = levels[index];
                          return GestureDetector(
                              onTap: () => {
                                    setState(() {
                                      selectedLevels = index;
                                    })
                                  },
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    height: 65,
                                    decoration: BoxDecoration(
                                      color: selectedLevels == index
                                          ? AppColors.lightblue
                                          : AppColors.lightGrey,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: selectedLevels == index
                                              ? AppColors.primaryColor
                                              : AppColors.lightGrey),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              height: 20,
                                              width: 35,
                                              child: Image.asset(
                                                item['icon']!,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.6,
                                            child: Label(
                                                txt: item['title'] ?? "",
                                                type: TextTypes.f_20_500),
                                          ),
                                          Icon(Icons.check,
                                              size: 30,
                                              color: selectedLevels == index
                                                  ? AppColors.green
                                                  : AppColors.lightGrey)
                                        ]),
                                  )));
                        },
                      ),
                    ),
                  if (activeIndex == 2)
                    // Expanded(
                    //   child: ListView.builder(
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     itemCount: trainingop.length,
                    //     itemBuilder: (context, index) {
                    //       return GestureDetector(
                    //           onTap: () => {
                    //                 setState(() {
                    //                   selectedTrain = index;
                    //                 })
                    //               },
                    //           child: Padding(
                    //               padding:
                    //                   const EdgeInsets.symmetric(vertical: 10),
                    //               child: Container(
                    //                 padding: const EdgeInsets.symmetric(
                    //                   horizontal: 15,
                    //                 ),
                    //                 height: 60,
                    //                 decoration: BoxDecoration(
                    //                   color: selectedTrain == index
                    //                       ? AppColors.lightblue
                    //                       : AppColors.lightGrey,
                    //                   borderRadius: BorderRadius.circular(15),
                    //                   border: Border.all(
                    //                       color: selectedTrain == index
                    //                           ? AppColors.primaryColor
                    //                           : AppColors.lightGrey),
                    //                 ),
                    //                 child: Row(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.spaceBetween,
                    //                     children: [
                    //                       const Align(
                    //                         alignment: Alignment.center,
                    //                         child: Icon(
                    //                             Icons.sports_cricket_sharp,
                    //                             size: 40,
                    //                             color: AppColors.primaryColor),
                    //                       ),
                    //                       Label(
                    //                           txt: trainingop[index],
                    //                           type: TextTypes.f_22_500),
                    //                       Icon(Icons.check,
                    //                           size: 30,
                    //                           color: selectedTrain == index
                    //                               ? AppColors.green
                    //                               : AppColors.lightGrey)
                    //                     ]),
                    //               )));
                    //     },
                    //   ),
                    // ),
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: trainingop.length,
                        itemBuilder: (context, index) {
                          final item = trainingop[index];
                          return GestureDetector(
                              onTap: () => {
                                    setState(() {
                                      selectedTrain = index;
                                    })
                                  },
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    height: 65,
                                    decoration: BoxDecoration(
                                      color: selectedTrain == index
                                          ? AppColors.lightblue
                                          : AppColors.lightGrey,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: selectedTrain == index
                                              ? AppColors.primaryColor
                                              : AppColors.lightGrey),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              height: 35,
                                              width: 35,
                                              child: Image.asset(
                                                item['icon']!,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.6,
                                            child: Label(
                                                txt: item['title'] ?? "",
                                                type: TextTypes.f_20_500),
                                          ),
                                          Icon(Icons.check,
                                              size: 30,
                                              color: selectedTrain == index
                                                  ? AppColors.green
                                                  : AppColors.lightGrey)
                                        ]),
                                  )));
                        },
                      ),
                    ),
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: SizedBox(
                width: double.infinity,
                child: commonButton(
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PgSignup()),
                              )
                            }
                        },
                    txt: "Next",
                    context: context),
              ),
            ),
          ]),
        ));
  }
}
