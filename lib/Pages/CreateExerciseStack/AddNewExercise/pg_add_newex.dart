import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/common_button.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';

class PgAddNewex extends StatefulWidget {
  const PgAddNewex({super.key});

  @override
  State<PgAddNewex> createState() => _PgAddNewexState();
}

class _PgAddNewexState extends State<PgAddNewex> {
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
                child: const Stack(
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Label(
                          txt: "Add new exercise",
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
                          Label(
                            txt: "Squats",
                            type: TextTypes.f_16_700,
                            forceColor: AppColors.whiteColor,
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
                        txt: "The name of the exercise",
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
                          txt: "Descripe the exercise  in details",
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
                          txt: "Give general instruction ",
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
                          txt: "Prepartion for the exercise",
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
                          txt: "Excuting the excercise",
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
              if (activeIndex == 2)
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        const Label(
                          txt: "Images that shows how to execute the exercise",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 110,
                          width: 110,
                          child: Image.asset(
                            AppAssets.addimg,
                            fit: BoxFit.contain,
                          ),
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
                          txt: "Type",
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
                                  height: 70,
                                  width: 70,
                                  child: Image.asset(
                                    AppAssets.milestone,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Isolation",
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
                                  height: 70,
                                  width: 70,
                                  child: Image.asset(
                                    AppAssets.milestone,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Compound",
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
                                  height: 70,
                                  width: 70,
                                  child: Image.asset(
                                    AppAssets.milestone,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "None",
                                  type: TextTypes.f_14_700,
                                ),
                              ],
                            )
                          ],
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
                          txt: "Single Primery Muscles",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 90,
                              width: 90,
                              child: Image.asset(
                                AppAssets.back1,
                                // fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: 90,
                              child: Image.asset(
                                AppAssets.back2,
                                // fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: 90,
                              child: Image.asset(
                                AppAssets.back3,
                                // fit: BoxFit.contain,
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              if (activeIndex == 5)
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        const Label(
                          txt: "Mechanics",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 32,
                          width: 120,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.primaryColor),
                          ),
                          child: const Align(
                              alignment: Alignment.center,
                              child: Label(
                                txt: "Strength",
                                type: TextTypes.f_14_700,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Label(
                          txt: "Equipment",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 32,
                          width: 120,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.primaryColor),
                          ),
                          child: const Align(
                              alignment: Alignment.center,
                              child: Label(
                                txt: "Strength",
                                type: TextTypes.f_14_700,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Label(
                          txt: "Force",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 32,
                          width: 120,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.primaryColor),
                          ),
                          child: const Align(
                              alignment: Alignment.center,
                              child: Label(
                                txt: "Strength",
                                type: TextTypes.f_14_700,
                              )),
                        )
                      ],
                    )),
              if (activeIndex == 6)
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
              const SizedBox(height: 90),
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
                  else if (activeIndex == 5)
                    {
                      setState(() {
                        activeIndex = 6;
                      })
                    }
                  else
                    {Navigator.pop(context)}
                },
              ),
              const SizedBox(height: 80),
            ],
          ),
        ])));
  }
}
