import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/features/workout/data/models/model_get_exercises.dart';
import 'package:gymlogix/features/workout/presentation/create_exercise/AddExerciseDays/pg_add_ex_days.dart';
import  'package:gymlogix/generic_widgets/common_dotted_btn.dart';
import 'package:gymlogix/generic_widgets/program_header.dart';
import   'package:gymlogix/features/workout/presentation/widgets/plan_header.dart'; 
import '../../../../../generic_widgets/common_button.dart';
import '../../../../../generic_widgets/common_datalist_highligther.dart';
import '../../../../base/presentation/screens/dashboard/tab_plan/build_plan_list.dart';
import '../../providers/exercise_provider.dart'; 

class PgAddworkout extends ConsumerStatefulWidget {
  const PgAddworkout({super.key});

  @override
  ConsumerState<PgAddworkout> createState() => _PgAddworkoutState();
}

class _PgAddworkoutState extends ConsumerState<PgAddworkout> {
  // ref.watch(stateGetExerciseProvider.notifier);
   List<PackageCollectionBox> stateExercises = [];
@override
  void initState() {
      stateExercises = ref.read(stateGetExerciseProvider.notifier).getPackedExercise();

    print("kokokok");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //attatch Exercise builder 
   print("uooi77777777777j");
     
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: commonButton(
          txt: "Create Now",
          context: context,
          onPressed: () => {
            //togglePage(youWantForward: true)},
          }
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
            child: Column(children: [
               PlanPageHeader(title: "Custom workout plan", onBackPress: (){
                Navigator.pop(context);
               }),
          // Container(
          //   height: 120,
          //   decoration: const BoxDecoration(
          //     color: AppColors.primaryColor,
          //   ),
          //   child: Stack(
          //     children: [
          //      const PositionBackGround(),
          //      PlanPageHeader(title: "Custom workout plan", onBackPress: (){
          //       Navigator.pop(context);
          //      })
              
          //     ],
          //   ),
          // ),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const ProgramHeader(topTitle: "", subTitleLeft: "PPL Bulking\nTue Aug 23, 2024")
            ,
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            //   height: 176,
            //   width: double.infinity,
            //   decoration: const BoxDecoration(
            //     color: AppColors.grey,
            //   ),
            //   child: Stack(
            //     children: [
            //       Positioned(
            //         bottom: 10,
            //         left: 10,
            //         right: 10,
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             const Label(
            //               txt: "PPL Bulking",
            //               type: TextTypes.f_16_700,
            //               forceColor: AppColors.whiteColor,
            //             ),
            //             SizedBox(
            //               height: 35,
            //               width: 35,
            //               child: Image.asset(
            //                 AppAssets.edit,
            //                 fit: BoxFit.contain,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
         
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40,
                        child: Label(
                          txt: "3",
                          type: TextTypes.f_32_700,
                          forceColor: AppColors.primaryColor,
                        ),
                      ),
                      Label(
                        txt: "Days",
                        type: TextTypes.f_10_500,
                        forceColor: AppColors.privacyTxt,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 35,
                        child: Image.asset(
                          AppAssets.edurance,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Label(
                        txt: "Endurance",
                        type: TextTypes.f_10_500,
                        forceColor: AppColors.privacyTxt,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 36,
                        child: Image.asset(
                          AppAssets.home,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Label(
                        txt: "Home",
                        type: TextTypes.f_10_500,
                        forceColor: AppColors.privacyTxt,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: Image.asset(
                          AppAssets.calender,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Label(
                        txt: "12 Weeks",
                        type: TextTypes.f_10_500,
                        forceColor: AppColors.privacyTxt,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 32,
                        width: 50,
                        child: Image.asset(
                          AppAssets.rating,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Label(
                        txt: "Beginners",
                        type: TextTypes.f_10_500,
                        forceColor: AppColors.privacyTxt,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Label(
              txt: "Workouts",
              type: TextTypes.f_14_700,
              forceColor: AppColors.primaryColor,
            ),
            stateExercises.isEmpty ?
            //  stateExercises.isEmpty ?
  CommonDottedButton(onClick:(){
    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const PgAddExDays()),
).then((value) {
  // Called when SecondScreen is popped
  setState(() {
     stateExercises = ref.read(stateGetExerciseProvider.notifier).getPackedExercise();

  });
   
});
 
}) :
             Column(
               children: [
                 ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount: stateExercises.length,
                   itemBuilder:(context , index){
                    final objData = stateExercises[index];
                  return   Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15,top: 15),
                    child: CommonDatalistHighligther(
                                title: objData.title, subTitle: objData.subTitle),
                  );
                 }),
               InkWell( 
                onTap: () {
                   Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const PgAddExDays()),
).then((value) {
  // Called when SecondScreen is popped
  setState(() {
     stateExercises = ref.read(stateGetExerciseProvider.notifier).getPackedExercise();

  });
   
});
                },
                 child: Padding(
                   padding: const EdgeInsets.only(right:15.0),
                   child: Align(
                    
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
                 ),
               ),
               ],
             )
//             stateExercises.when(data: (exercise){
// return ListView.builder(
//   physics: const NeverScrollableScrollPhysics(),
//   shrinkWrap: true,
//   itemCount: stateExercises.length,
//   itemBuilder:(context , index){
//  return const Padding(
//    padding: EdgeInsets.all(15.0),
//    child: CommonDatalistHighligther(
//                             title: "Day 1", subTitle: "10 Exercise"),
//  );
// });
//             }, 
//              error:(error, stackTrace) {
//           return  OnDataError(callback: (){

//             });
//           },
//           loading: () {
//              return const   CircularProgressIndicator();
//           },
//             ),
              
        
            ,
            const SizedBox(
              height: 60,
            ),
            const Label(
              txt: "Description",
              type: TextTypes.f_14_700,
              forceColor: AppColors.primaryColor,
            ),
            const Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: (Label(
                      txt: "This is the description of the program",
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
            const Padding(
                padding: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 50),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: (Label(
                      txt: "This is the insturation of the program",
                      type: TextTypes.f_12_500i,
                      forceColor: AppColors.privacyTxt,
                    )))),

                   const  SizedBox(height: 100,)
          ])
        ])));
  }
}

