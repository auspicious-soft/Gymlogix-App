import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/features/global_widgets/common_button.dart';

class PgNotes extends StatefulWidget {
  const PgNotes({super.key});

  @override
  State<PgNotes> createState() => _PgNotesState();
}

class _PgNotesState extends State<PgNotes> {
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
                            txt: "Adding Image",
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
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Label(
                  txt: "Image",
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
                height: 14,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 164,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(20)),
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Label(
                  txt: "Notes",
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
                height: 8,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 164,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.lightGrey)),
                  )),
              const SizedBox(
                height: 50,
              ),
              commonButton(
                context: context,
                txt: "Log note",
                onPressed: () => {},
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          )))
        ],
      ),
    );
  }
}
