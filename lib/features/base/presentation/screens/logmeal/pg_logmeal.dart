import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/global_widgets/common_button.dart';

class PgLogmeal extends StatefulWidget {
  const PgLogmeal({super.key});

  @override
  State<PgLogmeal> createState() => _PgLogmealState();
}

class _PgLogmealState extends State<PgLogmeal> {
  int selectedIndex = 1; // Default selected index
  final List<String> percentages = ["0%", "10%", "20%"]; // Picker items

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
                            txt: "Food instake",
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
                                txt: 'Rice with chicken',
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
                                txt: "Food list",
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Label(
                                    txt: "White Rice",
                                    type: TextTypes.f_15_500,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Label(
                                    txt: "500g",
                                    type: TextTypes.f_15_500,
                                    forceColor: AppColors.grey,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                      initialItem: selectedIndex),
                                  itemExtent: 30,
                                  onSelectedItemChanged: (int index) {
                                    setState(() {
                                      selectedIndex = index;
                                      print(
                                          "Selected: ${percentages[selectedIndex]}");
                                    });
                                  },
                                  children: percentages
                                      .map((percentage) => Center(
                                            child: Label(
                                              txt: percentage,
                                              type: TextTypes.f_12_900,
                                              forceColor: percentage ==
                                                      percentages[selectedIndex]
                                                  ? AppColors.primaryColor
                                                  : AppColors.grey,
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Label(
                                    txt: "White Rice",
                                    type: TextTypes.f_15_500,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Label(
                                    txt: "500g",
                                    type: TextTypes.f_15_500,
                                    forceColor: AppColors.grey,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                      initialItem: selectedIndex),
                                  itemExtent: 30,
                                  onSelectedItemChanged: (int index) {
                                    setState(() {
                                      selectedIndex = index;
                                      print(
                                          "Selected: ${percentages[selectedIndex]}");
                                    });
                                  },
                                  children: percentages
                                      .map((percentage) => Center(
                                            child: Label(
                                              txt: percentage,
                                              type: TextTypes.f_12_900,
                                              forceColor: percentage ==
                                                      percentages[selectedIndex]
                                                  ? AppColors.primaryColor
                                                  : AppColors.grey,
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Label(
                                txt: "Estimate Macros",
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
                                txt: "Log meal",
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
