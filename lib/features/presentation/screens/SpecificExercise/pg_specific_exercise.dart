import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/app_settings/constants/app_dim.dart';
import 'package:gymlogix/app_settings/constants/common_button.dart';

class PgSpecificExercise extends StatefulWidget {
  const PgSpecificExercise({super.key});

  @override
  State<PgSpecificExercise> createState() => _PgSpecificExerciseState();
}

class _PgSpecificExerciseState extends State<PgSpecificExercise> {
  int selectedIndex = 0;
  bool history = false;
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
                            txt: "Workout detail",
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
                            AppAssets.program,
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
                                txt: 'PPL bulking',
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () => {
                                      setState(() {
                                        selectedIndex = 0;
                                      })
                                    },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: selectedIndex == 0
                                          ? AppColors.primaryColor
                                          : const Color.fromARGB(
                                              255, 241, 236, 236),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Label(
                                      txt: "Last Workout",
                                      type: TextTypes.f_14_500,
                                      forceColor: selectedIndex == 0
                                          ? AppColors.whiteColor
                                          : AppColors.blackColor,
                                    ))),
                            GestureDetector(
                                onTap: () => {
                                      setState(() {
                                        selectedIndex = 1;
                                      })
                                    },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: selectedIndex == 1
                                          ? AppColors.primaryColor
                                          : const Color.fromARGB(
                                              255, 241, 236, 236),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Label(
                                      txt: "Max Weight",
                                      type: TextTypes.f_14_500,
                                      forceColor: selectedIndex == 1
                                          ? AppColors.whiteColor
                                          : AppColors.blackColor,
                                    ))),
                            GestureDetector(
                                onTap: () => {
                                      setState(() {
                                        selectedIndex = 2;
                                      })
                                    },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: selectedIndex == 2
                                          ? AppColors.primaryColor
                                          : const Color.fromARGB(
                                              255, 241, 236, 236),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Label(
                                      txt: "Last Exercise",
                                      type: TextTypes.f_14_500,
                                      forceColor: selectedIndex == 2
                                          ? AppColors.whiteColor
                                          : AppColors.blackColor,
                                    ))),
                          ])),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 241, 236, 236),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(
                          txt: "",
                          type: TextTypes.f_15_700,
                        ),
                        Label(
                          txt: "Weight(kg)",
                          type: TextTypes.f_15_700,
                        ),
                        Label(
                          txt: "Reps",
                          type: TextTypes.f_15_700,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 236, 236),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Container(
                                  width: 16,
                                  height: 53,
                                  decoration: const BoxDecoration(
                                      color: AppColors.yellow,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10))),
                                ),
                                padHorizontal(8),
                                const Label(
                                  txt: "1",
                                  type: TextTypes.f_25_500,
                                  forceColor:
                                      Color.fromARGB(255, 181, 174, 174),
                                ),
                              ]),
                              const Label(
                                txt: "46",
                                type: TextTypes.f_25_500,
                                forceColor: Color.fromARGB(255, 181, 174, 174),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Label(
                                  txt: "9",
                                  type: TextTypes.f_25_500,
                                  forceColor:
                                      Color.fromARGB(255, 181, 174, 174),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 236, 236),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Container(
                                  width: 16,
                                  height: 53,
                                  decoration: const BoxDecoration(
                                      color: AppColors.yellow,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10))),
                                ),
                                padHorizontal(8),
                                const Label(
                                  txt: "1",
                                  type: TextTypes.f_25_500,
                                  forceColor:
                                      Color.fromARGB(255, 181, 174, 174),
                                ),
                              ]),
                              const Label(
                                txt: "46",
                                type: TextTypes.f_25_500,
                                forceColor: Color.fromARGB(255, 181, 174, 174),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Label(
                                  txt: "9",
                                  type: TextTypes.f_25_500,
                                  forceColor:
                                      Color.fromARGB(255, 181, 174, 174),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 236, 236),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Container(
                                  width: 16,
                                  height: 53,
                                  decoration: const BoxDecoration(
                                      color: AppColors.yellow,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10))),
                                ),
                                padHorizontal(8),
                                const Label(
                                  txt: "1",
                                  type: TextTypes.f_25_500,
                                  forceColor:
                                      Color.fromARGB(255, 181, 174, 174),
                                ),
                              ]),
                              const Label(
                                txt: "46",
                                type: TextTypes.f_25_500,
                                forceColor: Color.fromARGB(255, 181, 174, 174),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Label(
                                  txt: "9",
                                  type: TextTypes.f_25_500,
                                  forceColor:
                                      Color.fromARGB(255, 181, 174, 174),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Label(
                              txt: "",
                              type: TextTypes.f_15_700,
                            ),
                            Label(
                              txt: "20T(2)",
                              type: TextTypes.f_15_700,
                            ),
                            Label(
                              txt: "30",
                              type: TextTypes.f_15_700,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Label(
                              txt: "",
                              type: TextTypes.f_15_700,
                            ),
                            Label(
                              txt: "20T",
                              type: TextTypes.f_15_700,
                              forceColor: Color.fromARGB(255, 181, 174, 174),
                            ),
                            Label(
                              txt: "30",
                              type: TextTypes.f_15_700,
                              forceColor: Color.fromARGB(255, 181, 174, 174),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              _logginRepModal(context);
                            },
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.add,
                                        size: 30,
                                        color: AppColors.whiteColor,
                                      )),
                                ))),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(children: [
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
                                height: 10,
                              ),
                            ])),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          history = !history;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightGrey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Label(
                              txt: "History",
                              type: TextTypes.f_15_700,
                            ),
                            Icon(
                                history == false
                                    ? Icons.keyboard_arrow_right
                                    : Icons.keyboard_arrow_down_sharp,
                                size: 30,
                                color: AppColors.grey)
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  if (history == true)
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.lightGrey),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    height: 55,
                                    width: 55,
                                    child: Image.asset(
                                      AppAssets.pushup,
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
                                    txt: "Pushups Day1",
                                    type: TextTypes.f_15_700,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Label(
                                          txt: "Tue Aug 23, 2024 15:35",
                                          type: TextTypes.f_12_500i,
                                          forceColor: AppColors.grey,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Label(
                                          txt: "1. 46kg  10m  04’’00  x1",
                                          type: TextTypes.f_12_500,
                                          forceColor: AppColors.grey,
                                        ),
                                        Label(
                                          txt: "2. 46kg  10m  04’’00  x1",
                                          type: TextTypes.f_12_500,
                                          forceColor: AppColors.grey,
                                        ),
                                      ])
                                ],
                              ),
                            ],
                          ),
                        )),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  commonButton(
                    txt: "Finish Excercise",
                    context: context,
                    onPressed: () => {Navigator.pop(context)},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 222, 93, 123),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Label(
                                          txt: "Workout",
                                          type: TextTypes.f_12_900,
                                          forceColor: AppColors.whiteColor,
                                        ),
                                        Label(
                                          txt: "43:00",
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 222, 93, 123),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Label(
                                          txt: "Exercise",
                                          type: TextTypes.f_12_900,
                                          forceColor: AppColors.whiteColor,
                                        ),
                                        Label(
                                          txt: "43:00",
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _logginRepModal(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
              color: Colors.transparent, // Makes the background transparent
              child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Label(
                                txt: "Reps",
                                type: TextTypes.f_15_700,
                              ),
                              Label(
                                txt: "Weight",
                                type: TextTypes.f_15_700,
                              ),
                              Label(
                                txt: "Distance",
                                type: TextTypes.f_15_700,
                              ),
                              Label(
                                txt: "Time",
                                type: TextTypes.f_15_700,
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Label(
                                txt: "1h",
                                type: TextTypes.f_14_500,
                                forceColor: AppColors.grey,
                              ),
                              Label(
                                txt: "1h",
                                type: TextTypes.f_14_500,
                                forceColor: AppColors.grey,
                              ),
                              Label(
                                txt: "1h",
                                type: TextTypes.f_14_500,
                                forceColor: AppColors.grey,
                              ),
                              Label(
                                txt: "1h",
                                type: TextTypes.f_14_500,
                                forceColor: AppColors.grey,
                              ),
                            ],
                          )),
                      const Divider(),
                      const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Label(
                                txt: "2h",
                                type: TextTypes.f_14_500,
                                forceColor: AppColors.primaryColor,
                              ),
                              Label(
                                txt: "2h",
                                type: TextTypes.f_14_500,
                                forceColor: AppColors.primaryColor,
                              ),
                              Label(
                                txt: "2h",
                                type: TextTypes.f_14_500,
                                forceColor: AppColors.primaryColor,
                              ),
                              Label(
                                txt: "2h",
                                type: TextTypes.f_14_500,
                                forceColor: AppColors.primaryColor,
                              ),
                            ],
                          )),
                      const Divider(),
                      const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Label(
                                txt: "1h",
                                type: TextTypes.f_14_500,
                                forceColor: AppColors.grey,
                              ),
                              Label(
                                txt: "1h",
                                type: TextTypes.f_14_500,
                                forceColor: AppColors.grey,
                              ),
                              Label(
                                txt: "1h",
                                type: TextTypes.f_14_500,
                                forceColor: AppColors.grey,
                              ),
                              Label(
                                txt: "1h",
                                type: TextTypes.f_14_500,
                                forceColor: AppColors.grey,
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () => {},
                                    child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border:
                                              Border.all(color: AppColors.grey),
                                        ),
                                        child: const Label(
                                          txt: "Warmup",
                                          type: TextTypes.f_16_700,
                                          forceColor: AppColors.grey,
                                        ))),
                                padHorizontal(10),
                                GestureDetector(
                                    onTap: () => {},
                                    child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                              color: AppColors.green),
                                        ),
                                        child: const Label(
                                          txt: "Easy",
                                          type: TextTypes.f_16_700,
                                          forceColor: AppColors.green,
                                        ))),
                                padHorizontal(10),
                                GestureDetector(
                                    onTap: () => {},
                                    child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                              color: AppColors.yellow),
                                        ),
                                        child: const Label(
                                          txt: "Medium",
                                          type: TextTypes.f_16_700,
                                          forceColor: AppColors.yellow,
                                        ))),
                                padHorizontal(10),
                                GestureDetector(
                                    onTap: () => {},
                                    child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border:
                                              Border.all(color: AppColors.red),
                                        ),
                                        child: const Label(
                                          txt: "Hard",
                                          type: TextTypes.f_16_700,
                                          forceColor: AppColors.red,
                                        ))),
                              ])),
                      padVertical(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 246, 240, 240),
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: AppColors.lightGrey),
                            ),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.check,
                                  size: 16,
                                )),
                          ),
                          padHorizontal(10),
                          const Label(
                            txt: "Dropset",
                            type: TextTypes.f_18_500,
                          )
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: commonButton(
                            txt: "Add",
                            context: context,
                            onPressed: () => {Navigator.pop(context)},
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(children: [
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
                                border: Border.all(color: AppColors.lightGrey),
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
                          ])),
                      padVertical(20)
                    ],
                  )))),
        );
      },
    );
  }
}
