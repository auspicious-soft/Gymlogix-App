import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/features/base/data/models/gymplan_model.dart';
import 'package:gymlogix/features/base/presentation/providers/foodplan_provider.dart';
import 'package:gymlogix/features/base/presentation/providers/plans_provider.dart';

import '../../customplans/pg_customplans.dart';
import 'btn_more_plan.dart';
import 'tab_plan.dart';

class BuildPlanList extends ConsumerWidget {
  
  const BuildPlanList({super.key});
   
// int itemCount;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   // ref.refresh(stateFoodPlanProvider.notifier).refresh
    final stateGetPlan = ref.watch(stateGetPlanProvider);
   // return SizedBox( height:40,child:  CircularProgressIndicator());
    // Widget _buildPlanList(int itemCount) {
return stateGetPlan.maybeWhen(orElse: () {
   return const  SizedBox(
  height: 100,
  width: 100,
  child: const CircularProgressIndicator());
},
error: (error, stackTrace) {
   return ElevatedButton(onPressed: (){
     Future.delayed(Duration.zero).then(
      (_)   {
if (!context.mounted) return;
      ref.read(stateGetPlanProvider.notifier).getPlanData();
      }
     );
   }, child: const Text("Reload"));
},
data: (data) {
  print("welcome");
  print(data?.length.toString());

// return data == null ? SizedBox(
//   height: 100,
//   width: 100,
//   child: const CircularProgressIndicator()) :  buildOldList(data);
  
  return data == null ? const CircularProgressIndicator() : 
  Column(children: [
 ListView.builder(
    padding: EdgeInsets.zero,
     shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder:(context , index ){
      final workout = data[index];
      print(workout.content);
return GestureDetector(
            onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PgCustomplans()),
                  )
                },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 103,
                      width: 100,
                      child: Image.network(workout.imageUrl ?? "http",fit: BoxFit.contain, )
                      
                      // Image.asset(
                      //   AppAssets.program,
                      //   fit: BoxFit.contain,
                      // ),
                    ),
                    const SizedBox(width: 10),
                      Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Label(
                              txt:workout.type ?? "",
                              type: TextTypes.f_12_700,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Label(
                            txt:workout.content?.details ?? "",
                            type: TextTypes.f_10_500,
                            forceColor: AppColors.privacyTxt,
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                 
                  ],
                ),
                const SizedBox(height: 10),
               
              ],
            )
            );
     
  }, itemCount: data.take(3).toList().length),
   
     const SizedBox(height: 10,),
             Container(
              height: 60,
              child: 
              TextButton(
          onPressed: (){},
          child: BtnMorePlan()))
  ],);
 
  
},
loading: () {
  return const CircularProgressIndicator();
},
);

    
  }
}

 buildOldList(List<GymPlanData> data){
  return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
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
      }, childCount: data.length),
    );
 }