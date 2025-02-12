import 'package:flutter/material.dart';
import 'package:gymlogix/features/base/data/models/gymplan_model.dart';

import '../../../../../../app_settings/components/label.dart';
import '../../../../../../app_settings/constants/app_assets.dart';
import '../../../../../../app_settings/constants/app_colors.dart';
import '../../logmeal/pg_logmeal.dart';
import '../../logmeasurement/pg_logmeasurement.dart';
import '../../viewfood/pg_viewfood.dart';
 String _formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      final formattedDate =
          "${_getWeekday(parsedDate.weekday)} ${parsedDate.month} ${parsedDate.day}, ${parsedDate.year}";
      return formattedDate;
    } catch (e) {
      return 'Invalid Date';
    }
  }

  String _getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

class WidgetAllplans extends StatelessWidget{
  final List<GymPlanData>  plans;

  const WidgetAllplans({super.key,required this.plans});
  @override
  Widget build(BuildContext context) {
  return  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: plans.length,//exerciseData.length,
                    itemBuilder: (context, index) {
                       final exercise = plans[index];
                      final finishAt = exercise.updatedAt!.toIso8601String();
                      final formattedDate = _formatDate(finishAt);
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Label(
                                  txt: formattedDate,
                                  type: TextTypes.f_16_700,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                  onTap: () => {
                                        if (index == 0)
                                          {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PgLogmeal()),
                                            )
                                          }
                                        else if (index == 1)
                                          {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PgViewfood()),
                                            )
                                          }
                                        else if (index == 2)
                                          {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PgLogmeasurement()),
                                            )
                                          }
                                      },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    height: 84,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: AppColors.lightGrey),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 55,
                                          width: 55,
                                          child: Image.asset(
                                            AppAssets.dumbel,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
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
                                              txt: "formattedDate",
                                              type: TextTypes.f_13_700,
                                              forceColor: AppColors.grey,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              child: Label(
                                                txt: "exercise.comments",
                                                type: TextTypes.f_15_700,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ));
                    },
                  );
  }
  
}