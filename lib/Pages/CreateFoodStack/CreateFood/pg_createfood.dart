import 'package:flutter/material.dart';
import 'package:gymlogix/Pages/CreateFoodStack/AddFood/pg_addfood.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/common_button.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';

class PgCreatefood extends StatefulWidget {
  const PgCreatefood({super.key});

  @override
  State<PgCreatefood> createState() => _PgCreatefoodState();
}

class _PgCreatefoodState extends State<PgCreatefood> {
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
                        txt: "Give a meanigull name for your food plan",
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
                            hintText: "Type  name for food plan",
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
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      height: 43,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: AppColors.primaryColor),
                                      ),
                                      child: Row(children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            color: AppColors.lightGrey,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Label(
                                          txt: "Weight Lost",
                                          type: TextTypes.f_15_700,
                                        ),
                                      ])),
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      height: 43,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: AppColors.primaryColor),
                                      ),
                                      child: Row(children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            color: AppColors.lightGrey,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Label(
                                          txt: "Maintenance",
                                          type: TextTypes.f_15_700,
                                        ),
                                      ]))
                                ])),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      height: 43,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: AppColors.primaryColor),
                                      ),
                                      child: Row(children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            color: AppColors.lightGrey,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Label(
                                          txt: "Muscle Gain",
                                          type: TextTypes.f_15_700,
                                        ),
                                      ])),
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      height: 43,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: AppColors.primaryColor),
                                      ),
                                      child: Row(children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            color: AppColors.lightGrey,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "Body Recomposition",
                                          style: TextStyle(
                                              fontFamily: AppConst.fontFamily,
                                              fontSize: 9.5,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ]))
                                ]))
                      ],
                    )),
              if (activeIndex == 2)
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
                        SizedBox(
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
                  else
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PgAddfood()),
                      )
                    }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ])));
  }
}
