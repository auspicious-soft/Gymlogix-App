import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import  'package:gymlogix/app_settings/components/label.dart';
import  'package:gymlogix/app_settings/constants/app_colors.dart';
import  'package:gymlogix/features/workout/data/models/model_get_exercises.dart';

import '../providers/exercise_provider.dart';
 
class ExerciseListWidget extends ConsumerWidget {
  
  const ExerciseListWidget({
    super.key,
    required this.obj,
  });

   final ExerciseData obj;

  @override
                             Widget build(BuildContext context, WidgetRef ref) {
                               
    var exerciseChoose = ref.read(stateGetExerciseProvider.notifier);
    return Container(
                             padding: const EdgeInsets.symmetric(
                                 horizontal: 10, vertical: 10),
                             child: Row(
                               children: [
                                 ClipRRect(
                                     borderRadius:
                                         BorderRadius.circular(10),
                                     child: SizedBox(
                                       height: 55,
                                       width: 55,
                                       child: Image.network(
                                        obj.moviesLogoUrl ?? "http",
                                         fit: BoxFit.contain,
                                       ),
                                     )),
                                 const SizedBox(
                                   width: 15,
                                 ),
                                 Column(
                                   mainAxisAlignment:
                                       MainAxisAlignment.center,
                                   crossAxisAlignment:
                                       CrossAxisAlignment.start,
                                   children: [
                                       Label(
                                       txt:obj.name ?? ""  ,
                                       type: TextTypes.f_15_500,
                                     ),
                                     SizedBox(
                                       width: MediaQuery.of(context)
                                               .size
                                               .width /
                                           1.8,
                                       child:   Label(
                                         txt: obj.description ?? "",
                                         type: TextTypes.f_10_500,
                                         forceColor: AppColors.grey,
                                       ),
                                     )
                                   ],
                                 ),
                                 const Spacer(),
                                   SizedBox(
                                    height: 20,
                                    width: 20,
                                     child: Checkbox(value: obj.isSelected, onChanged: (status){
                                   //  obj.isSelected = val ?? false;
                                     exerciseChoose.packExercise(status ?? false , obj);
                                                                      }),
                                   ),
                                //  const Icon(
                                //    Icons.info,
                                //    size: 20,
                                //    color: AppColors.primaryColor,
                                //  ),
                               ],
                             ),
                           );
  }
}
