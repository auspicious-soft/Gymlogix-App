import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:gymlogix/features/food/presentation/CreateFood/widget_meal_list.dart';
import 'package:gymlogix/features/presentation/widgets/program_header.dart';
import 'package:gymlogix/features/presentation/providers/explore_provider.dart';
import 'package:gymlogix/features/presentation/providers/foodplan_provider.dart';
import 'package:gymlogix/features/presentation/screens/CreateExerciseStack/AddExerciseDays/pg_add_ex_days.dart';

import '../../../../app_settings/constants/common_button.dart';
import '../providers/food_source_provider.dart';
import '../providers/get_meal_provider.dart';
import '../widgets/meal_loader.dart';

class DataForPageAddPlan {
  final String planName;
  final String goalName;
  final String planDescription;
  final String planTip;

  DataForPageAddPlan(
      {required this.planName,
      required this.goalName,
      required this.planDescription,
      required this.planTip});
}

class PgAddfood extends ConsumerStatefulWidget {
  final DataForPageAddPlan planData;
  const PgAddfood({super.key, required this.planData});

  @override
  ConsumerState<PgAddfood> createState() => _PgAddfoodState();
}

class _PgAddfoodState extends ConsumerState<PgAddfood> {
  List<int> text = [];
  @override
  Widget build(BuildContext context) {
    //ref.watch(stateMealItemProvider.notifier);
    // final stateMeals = ref.watch(stateMealItemProvider);

    //  final exploreAsync = ref.watch(exploreItemsProvider);
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

          // WidgetMealList(),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
// stateFoodPlan.when(
//         data: (items) => ListView.builder(
//           shrinkWrap: true,
//           itemCount: items!.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(items[index].name ?? "No name"),
//             );
//           },
//         ),
//         loading: () => Center(child: CircularProgressIndicator()),
//         error: (err, stack) => Center(child: Text("Error: $err")),
//       ),

            ///HERE

          const  ProgramHeader(topTitle: "",subTitleLeft: "PPL Bulking",),
            const SizedBox(
              height: 40,
            ),
            const Label(
              txt: "Meals",
              type: TextTypes.f_14_700,
              forceColor: AppColors.primaryColor,
            ),
            Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WidgetMealList(
                          title: "My Meal 1", subTitle: "10 Foods"),
                    ),

        //     stateMeals.when(data: (data) {
        //       return Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Column(children: [
        //            for(var i = 0; i< data!.length; i++)
        // ...[
        //   Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: WidgetMealList(
        //                   title: data[i].name ?? "", subTitle: "10 Foods"),
        //             )
        // ],
                   
                    
                    
        //         ]));
        //     },
        //     error: (error, stackTrace) {
        //       return SizedBox();
        //     },
        //     loading: () {
        //     return MealLoader();
        //     },
        //     ),
           
//add workout or meal
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
                child: GestureDetector(
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PgAddExDays()),
                          )
                        },
                    child: DottedBorder(
                      color: const Color.fromRGBO(147, 141, 141, 1),
                      strokeWidth: 1,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(15),
                      dashPattern: const [6, 3],
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 61,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: Color.fromRGBO(147, 141, 141, 1),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Add workout",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(147, 141, 141, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))),
            //end

            Row(
              children: [
                Spacer(),
                SizedBox(
                  width: 100,
                  child: commonButton(
                    txt: "Add",
                    context: context,
                    forceTextType: TextTypes.f_15_500,
                    forceHeight: 40,
                    onPressed: () => {},
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            const Label(
              txt: "Description",
              type: TextTypes.f_14_700,
              forceColor: AppColors.primaryColor,
            ),
            Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: (Label(
                      txt: widget.planData.planDescription,
                      type: TextTypes.f_12_500i,
                      forceColor: AppColors.privacyTxt,
                    )))),
            const SizedBox(
              height: 20,
            ),
            const Label(
              txt: "Instructions",
              type: TextTypes.f_14_700,
              forceColor: AppColors.primaryColor,
            ),
            Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: (Label(
                      txt: widget.planData.planTip,
                      type: TextTypes.f_12_500i,
                      forceColor: AppColors.privacyTxt,
                    )))),

            commonButton(
              txt: "Create",
              context: context,
              onPressed: () => {},
            ),
            const SizedBox(
              height: 40,
            ),
          ])
        ])));
  }

  void showMessage(String msg) {
    var snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
