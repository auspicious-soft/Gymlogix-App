import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/generic_widgets/common_button.dart';

class WidgetMealList extends StatelessWidget{
 
 //  int selectedIndex = 1; // Default selected index
  //final List<String> meals;// = ["0%", "10%", "20%"];
final String title;
final String subTitle;
  WidgetMealList({super.key,required this.title,required this.subTitle});
  @override
  Widget build(BuildContext context) {
     
     return   
 Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               SizedBox(
                                height: 55,
                                width: 55,
                                child: Image.asset(
                                  AppAssets.mealRed,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

 Label(
                              txt: title,
                              type: TextTypes.f_16_700,
                              forceColor: AppColors.blackColor,
                            ),
                            Label(
                              txt: subTitle,
                              type: TextTypes.f_12_500,
                              forceColor: AppColors.grey,
                            ),
                            
                              ],)
             ,
                                
                             Spacer(),
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  AppAssets.dots,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          );
  }
  
  
}