import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

class TabInsight extends StatefulWidget {
  const TabInsight({super.key});

  @override
  State<TabInsight> createState() => _TabInsightState();
}

class _TabInsightState extends State<TabInsight> {
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
                      const Row(
                        children: [
                          SizedBox(width: 10),
                          Label(
                            txt: "INSIGHT",
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
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: SizedBox(
                              height: 45,
                              width: 45,
                              child: Image.asset(
                                AppAssets.program,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Label(
                                  txt: "John Smith",
                                  type: TextTypes.f_15_500,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  child: const Label(
                                    txt:
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    type: TextTypes.f_12_500,
                                  ),
                                )
                              ])
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.3,
                      width: double.infinity,
                      child: Image.asset(
                        AppAssets.program,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset(
                              AppAssets.heart,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )),
                    const SizedBox(height: 5),
                    const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Label(
                            txt: "September 19",
                            type: TextTypes.f_12_500,
                            forceColor: AppColors.grey,
                          ),
                        )),
                    const SizedBox(height: 15),
                    Container(
                      height: 1,
                      decoration: const BoxDecoration(
                        color: AppColors.lightGrey,
                      ),
                    ),
                    const SizedBox(height: 15),
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
