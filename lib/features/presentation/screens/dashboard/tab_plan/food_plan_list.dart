import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/features/data/models/get_food_plan_model.dart';
import 'package:gymlogix/features/presentation/screens/customplans/pg_customplans.dart';

import '../../../../../app_settings/components/label.dart';
import 'btn_more_plan.dart';

class BuildFoodPlanList extends StatelessWidget {
final List<FoodPlanData> foodplanList;

  const BuildFoodPlanList({super.key, required this.foodplanList});

  @override
  Widget build(BuildContext context) {
   // final stateGetPlan = ref.watch(stateGetPlanProvider);
   // return SizedBox( height:40,child:  CircularProgressIndicator());
    // Widget _buildPlanList(int itemCount) {
  
 return
  Column(children: [
 ListView.builder(
    padding: EdgeInsets.zero,
     shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder:(context , index ){
      final food = foodplanList[index];
      print(food.carbs);
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
                      child: Image.network(food.imageUrl ?? "http",fit: BoxFit.contain, )
                      
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
                              txt:food.name ?? "",
                              type: TextTypes.f_12_700,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Label(
                            txt:food.description ?? "Not Available",
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
     
  }, itemCount: foodplanList.take(3).toList().length),
   
     const SizedBox(height: 10,),
             Container(
              height: 60,
              child: 
              TextButton(
          onPressed: (){},
          child: BtnMorePlan()))
  ],);
 
 

    
  }
}