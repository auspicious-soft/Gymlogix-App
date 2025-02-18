import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:gymlogix/features/workout/data/models/model_get_exercises.dart';
import 'package:gymlogix/features/workout/presentation/create_exercise/AddExercise/pg_addexercise.dart';
class DayAdderData{
  final String dayName;
  final UniqueKey key;
  final ExerciseData? data;
  DayAdderData({required this.key, required this.dayName , required this.data});
  
}
class CommonDayAdder extends StatelessWidget {
  const CommonDayAdder({
    super.key,
    required this.showRemove,
    required this.title,
    required this.uniqueKey,
    required this.onClick
  });
  final bool  showRemove;
  final String title;
  final UniqueKey uniqueKey;
final Function(UniqueKey) onClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 37,
            width: 151,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: AppColors.pink2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Label(
                  txt: title,
                  type: TextTypes.f_16_700,
                  forceColor: AppColors.whiteColor,
                ),
                showRemove ?
                 InkWell(
                  onTap: () {
                    onClick(uniqueKey);
                  },
                   child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Icon(Icons.cancel,color: Colors.white,)
                      
                                   ),
                 ):const SizedBox.shrink(),
                // SizedBox(
                //   height: 24,
                //   width: 24,
                //   child: Image.asset(
                //     AppAssets.edit,
                //     fit: BoxFit.contain,
                //   ),
                // ),
                
              ],
            ),
          ),
        ));
  }
}
