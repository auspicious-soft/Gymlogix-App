import 'package:flutter/material.dart';
import 'package:gymlogix/Pages/CreateExerciseStack/createexercise/pg_createexericse.dart';
import 'package:gymlogix/Pages/CreateFoodStack/CreateFood/pg_createfood.dart';
import 'package:gymlogix/Pages/customplans/pg_customplans.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/app_settings/constants/common_button.dart';

class TabPlan extends StatefulWidget {
  const TabPlan({super.key});

  @override
  State<TabPlan> createState() => _TabPlanState();
}

class _TabPlanState extends State<TabPlan> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _selectGender = "Male";
  int workoutPlanItemCount = 3;
  int foodPlanItemCount = 3;
  int activePlanItemCount = 2;

  void _loadMoreItems(String section) {
    setState(() {
      if (section == 'workout') {
        workoutPlanItemCount += 5;
      } else if (section == 'food') {
        foodPlanItemCount += 5;
      } else if (section == 'active') {
        activePlanItemCount += 5;
      }
    });
  }

  bool workoutplan = true;
  bool foodplan = true;
  bool activeplan = true;
  bool autoNextExercise = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.whiteColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 120,
              decoration: const BoxDecoration(color: AppColors.primaryColor),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      AppAssets.background,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            SizedBox(width: 10),
                            Label(
                              txt: "PLANS",
                              type: TextTypes.f_16_700,
                              forceColor: AppColors.whiteColor,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              child: SizedBox(
                                height: 35,
                                width: 35,
                                child: Image.asset(
                                  AppAssets.filter,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildSectionHeader("Workout plan"),
          if (workoutplan == true) _buildPlanList(workoutPlanItemCount),
          if (workoutplan == true)
            _buildLoadMoreButton(() => _loadMoreItems('workout')),
          _buildSectionHeader("Food plans"),
          if (foodplan == true) _buildPlanList(foodPlanItemCount),

          if (foodplan == true)
            _buildLoadMoreButton(() => _loadMoreItems('food')),
          _buildSectionHeader("Active plan"),
          if (activeplan == true) _activePlanList(activePlanItemCount),
          // _buildLoadMoreButton(() => _loadMoreItems('active')),
        ],
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        iconTheme: const IconThemeData(size: 30),
        activeIcon: Icons.close,
        backgroundColor: AppColors.primaryColor,
        overlayOpacity: 0.4,
        overlayColor: Colors.black,
        foregroundColor: Colors.white,
        spaceBetweenChildren: 10,
        children: [
          SpeedDialChild(
            child: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset(
                AppAssets.food,
                fit: BoxFit.contain,
              ),
            ),
            label: 'Food plan',
            labelStyle: const TextStyle(
                fontSize: 14,
                fontFamily: AppConst.fontFamily,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PgCreatefood()),
              );
            },
          ),
          SpeedDialChild(
            label: 'Workout plan',
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                AppAssets.dumbel2,
                fit: BoxFit.contain,
              ),
            ),
            labelStyle: const TextStyle(
                fontSize: 14,
                fontFamily: AppConst.fontFamily,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PgCreateexericse()),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Label(
                txt: 'Plan Filter',
                type: TextTypes.f_20_700,
                forceColor: AppColors.whiteColor,
              ),
            ),
            _buildDrawerListTile(AppAssets.gender, 'Gender', trailing: 'Male'),
            _buildDrawerListTile(AppAssets.goal, 'Goals'),
            _buildDrawerListTile(AppAssets.place, 'Place', trailing: 'Gym'),
            _buildDrawerListTile(AppAssets.freq, 'Frequency'),
            _buildDrawerListTile(AppAssets.level, 'Level',
                trailing: 'Beginner'),
            _buildDrawerListTile(AppAssets.cal, 'Calories'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return SliverToBoxAdapter(
        child: Column(children: [
      const SizedBox(
        height: 50,
      ),
      GestureDetector(
        onTap: () => {
          if (title == "Workout plan")
            setState(() {
              workoutplan = !workoutplan;
            })
          else if (title == "Food plans")
            {
              setState(() {
                foodplan = !foodplan;
              })
            }
          else if (title == "Active plan")
            {
              setState(() {
                activeplan = !activeplan;
              })
            }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          height: 40,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(
                  txt: title,
                  type: TextTypes.f_16_700,
                  forceColor: AppColors.whiteColor),
              const Label(
                  txt: "-",
                  type: TextTypes.f_18_600,
                  forceColor: AppColors.whiteColor),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
    ]));
  }

  Widget _buildPlanList(int itemCount) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
              onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PgCustomplans()),
                    )
                  },
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 103,
                        width: 100,
                        child: Image.asset(
                          AppAssets.program,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Label(
                                txt: "Upper Lower program",
                                type: TextTypes.f_12_700,
                              ),
                            ),
                            SizedBox(height: 5),
                            Label(
                              txt:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                              type: TextTypes.f_10_500,
                              forceColor: AppColors.privacyTxt,
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ));
        },
        childCount: itemCount,
      ),
    );
  }

  Widget _activePlanList(int itemCount) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 81,
                    width: 81,
                    child: Image.asset(
                      AppAssets.program,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Label(
                            txt: "Upper Lower program",
                            type: TextTypes.f_12_700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Label(
                          txt: "Tue Aug 24 2024",
                          type: TextTypes.f_10_500,
                          forceColor: AppColors.privacyTxt,
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 0),
            ],
          );
        },
        childCount: itemCount,
      ),
    );
  }

  Widget _buildLoadMoreButton(VoidCallback onPressed) {
    return SliverToBoxAdapter(
      child: GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            height: 22,
            width: double.infinity,
            decoration: BoxDecoration(
                // border: Border.all(color: AppColors.lightGrey),
                ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Label(
                  txt: "More Plan",
                  type: TextTypes.f_14_500,
                  forceColor: AppColors.primaryColor,
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildDrawerListTile(String assetPath, String title,
      {String trailing = ''}) {
    return ListTile(
        leading: SizedBox(
          height: 24,
          width: 24,
          child: Image.asset(
            assetPath,
            fit: BoxFit.contain,
          ),
        ),
        title: Label(txt: title, type: TextTypes.f_16_500),
        trailing: trailing.isNotEmpty
            ? Label(txt: trailing, type: TextTypes.f_10_500)
            : null,
        onTap: () => {
              _scaffoldKey.currentState?.closeDrawer(),
              if (title == "Gender")
                {_showGenderModal(context)}
              else if (title == "Goals")
                {_showGoal(context)}
              else if (title == "Place")
                {_placeModal(context)}
              else if (title == "Frequency")
                {_weekDayModal(context)}
              else if (title == "Level")
                {_showLevel(context)}
              else if (title == "Calories")
                {_coloriesModal(context)}
            });
  }

  void _showGenderModal(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            // height: MediaQuery.of(context).size.height / 3.5,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
            child:
                //  SingleChildScrollView(
                //   child:

                Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Label(
                          txt: "Gender",
                          type: TextTypes.f_18_500,
                          forceColor: AppColors.whiteColor,
                        ),
                        GestureDetector(
                          onTap: () => {Navigator.pop(context)},
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ]),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Label(
                          txt: "Choose Gender",
                          type: TextTypes.f_16_700,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            FocusScope(
                              child: GestureDetector(
                                  onTap: () => {
                                        print("male"),
                                        setState(() {
                                          _selectGender = "Male";
                                        })
                                      },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    alignment: Alignment.centerLeft,
                                    height: 30,
                                    width: 65,
                                    decoration: BoxDecoration(
                                      color: _selectGender == "Male"
                                          ? AppColors.primaryColor
                                          : AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Label(
                                          txt: "Male",
                                          type: TextTypes.f_16_500,
                                          forceColor: _selectGender == "Male"
                                              ? AppColors.whiteColor
                                              : AppColors.primaryColor,
                                        )),
                                  )),
                            ),
                            const SizedBox(width: 15),
                            FocusScope(
                              child: GestureDetector(
                                  onTap: () => {
                                        setState(() {
                                          _selectGender = "Female";
                                        })
                                      },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    alignment: Alignment.centerLeft,
                                    height: 30,
                                    width: 85,
                                    decoration: BoxDecoration(
                                      color: _selectGender == "Female"
                                          ? AppColors.primaryColor
                                          : AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Label(
                                          txt: "Female",
                                          type: TextTypes.f_16_500,
                                          forceColor: _selectGender == "Female"
                                              ? AppColors.whiteColor
                                              : AppColors.primaryColor,
                                        )),
                                  )),
                            ),
                            const SizedBox(width: 15),
                            FocusScope(
                              child: GestureDetector(
                                  onTap: () => {
                                        setState(() {
                                          _selectGender = "Other";
                                        })
                                      },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    alignment: Alignment.centerLeft,
                                    height: 30,
                                    width: 65,
                                    decoration: BoxDecoration(
                                      color: _selectGender == "Other"
                                          ? AppColors.primaryColor
                                          : AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Label(
                                          txt: "Other",
                                          type: TextTypes.f_16_500,
                                          forceColor: _selectGender == "Other"
                                              ? AppColors.whiteColor
                                              : AppColors.primaryColor,
                                        )),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: commonButton(
                                txt: "Done",
                                context: context,
                                onPressed: () => {},
                              )),
                        )
                      ],
                    )),
                const SizedBox(height: 15),
              ],
            ),
          ),
          // )
        );
      },
    );
  }

  void _showGoal(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            // height: MediaQuery.of(context).size.height / 3.7,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
            child:
                // SingleChildScrollView(
                //   child:
                Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Label(
                          txt: "Goal",
                          type: TextTypes.f_18_500,
                          forceColor: AppColors.whiteColor,
                        ),
                        GestureDetector(
                          onTap: () => {Navigator.pop(context)},
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ]),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Label(
                          txt: "Select goal",
                          type: TextTypes.f_16_700,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 40,
                          // width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.lightGrey),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Label(
                                txt: "Goal",
                                type: TextTypes.f_14_500,
                                forceColor: AppColors.grey,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                size: 20,
                                color: AppColors.grey,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: commonButton(
                                txt: "Done",
                                context: context,
                                onPressed: () => {},
                              )),
                        )
                      ],
                    )),
                const SizedBox(height: 15),
              ],
            ),
          ),
          // )
        );
      },
    );
  }

  void _placeModal(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              // height: MediaQuery.of(context).size.height / 3.4,
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
              child:
                  // SingleChildScrollView(
                  //   child:
                  Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Label(
                          txt: "Place",
                          type: TextTypes.f_18_500,
                          forceColor: AppColors.whiteColor,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Label(
                          txt: "Place",
                          type: TextTypes.f_16_700,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.lightGrey),
                              borderRadius: BorderRadius.circular(5)),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Enter place",
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontFamily: AppConst.fontFamily,
                            ),
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: commonButton(
                              txt: "Done",
                              context: context,
                              onPressed: () => {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
          // ),
        );
      },
    );
  }

  void _weekDayModal(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              // height: MediaQuery.of(context).size.height / 3.7,
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
              child:
                  // SingleChildScrollView(
                  //   child:
                  Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Label(
                          txt: "Days in week",
                          type: TextTypes.f_18_500,
                          forceColor: AppColors.whiteColor,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Label(
                          txt: "Days",
                          type: TextTypes.f_16_700,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 70, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Label(
                                  txt: "-",
                                  type: TextTypes.f_40_700,
                                ),
                                Label(
                                  txt: "3",
                                  type: TextTypes.f_40_700,
                                ),
                                Label(
                                  txt: "+",
                                  type: TextTypes.f_40_700,
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: commonButton(
                              txt: "Done",
                              context: context,
                              onPressed: () => {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
          // ),
        );
      },
    );
  }

  void _showLevel(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: Container(
          // height: MediaQuery.of(context).size.height / 3.7,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
          child:
              // SingleChildScrollView(
              //   child:
              Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                height: 40,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Label(
                        txt: "Level",
                        type: TextTypes.f_18_500,
                        forceColor: AppColors.whiteColor,
                      ),
                      GestureDetector(
                        onTap: () => {Navigator.pop(context)},
                        child: const Icon(
                          Icons.close,
                          size: 20,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ]),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Label(
                        txt: "Choose Level",
                        type: TextTypes.f_16_700,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        height: 40,
                        // width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.lightGrey),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Label(
                              txt: "Level",
                              type: TextTypes.f_14_500,
                              forceColor: AppColors.grey,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 20,
                              color: AppColors.grey,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: commonButton(
                              txt: "Done",
                              context: context,
                              onPressed: () => {},
                            )),
                      )
                    ],
                  )),
              const SizedBox(height: 15),
            ],
          ),
          // ),
        ));
      },
    );
  }

  void _coloriesModal(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: Container(
          // height: MediaQuery.of(context).size.height / 3.4,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
          child:
              //  SingleChildScrollView(
              //   child:
              Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                height: 40,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Label(
                        txt: "Calories Range",
                        type: TextTypes.f_18_500,
                        forceColor: AppColors.whiteColor,
                      ),
                      GestureDetector(
                        onTap: () => {Navigator.pop(context)},
                        child: const Icon(
                          Icons.close,
                          size: 20,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ]),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Label(
                        txt: "Choose Level",
                        type: TextTypes.f_16_700,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        alignment: Alignment.centerLeft,
                                        height: 33,
                                        width: 111,
                                        decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: AppColors.primaryColor),
                                        ),
                                        child: const Label(
                                          txt: "700",
                                          type: TextTypes.f_16_700,
                                          forceColor: AppColors.privacyTxt,
                                        ),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(left: 12),
                                          child: const Label(
                                            txt: "Min",
                                            type: TextTypes.f_12_500i,
                                            forceColor: AppColors.privacyTxt,
                                          )),
                                    ]),
                                const Label(
                                  txt: "-",
                                  type: TextTypes.f_16_700,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        alignment: Alignment.centerLeft,
                                        height: 33,
                                        width: 111,
                                        decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: AppColors.primaryColor),
                                        ),
                                        child: const Label(
                                          txt: "700",
                                          type: TextTypes.f_16_700,
                                          forceColor: AppColors.privacyTxt,
                                        ),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(left: 12),
                                          child: Label(
                                            txt: "Max",
                                            type: TextTypes.f_12_500i,
                                            forceColor: AppColors.privacyTxt,
                                          )),
                                    ]),
                              ])),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: commonButton(
                              txt: "Done",
                              context: context,
                              onPressed: () => {},
                            )),
                      )
                    ],
                  )),
              const SizedBox(height: 15),
            ],
          ),
          // ),
        ));
      },
    );
  }
}
