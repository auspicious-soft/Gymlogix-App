
 
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import  'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';

import '../../../../../app_settings/constants/app_assets.dart';
 

class PlanCreatorStep2 extends StatelessWidget {
    
  const PlanCreatorStep2({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return   Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        const Label(
                          txt: "Select the goals of your program",
                          type: TextTypes.f_14_700,
                          forceColor: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: Image.asset(
                                    AppAssets.mucle,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Hypertrophy",
                                  type: TextTypes.f_14_700,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: Image.asset(
                                    AppAssets.strength,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Strength",
                                  type: TextTypes.f_14_700,
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: Image.asset(
                                    AppAssets.edurance,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Endurance",
                                  type: TextTypes.f_14_700,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: Image.asset(
                                    AppAssets.cycle,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Cardio",
                                  type: TextTypes.f_14_700,
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: Image.asset(
                                    AppAssets.enhance,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Flexibility",
                                  type: TextTypes.f_14_700,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: Image.asset(
                                    AppAssets.milestone,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Label(
                                  txt: "Functional",
                                  type: TextTypes.f_14_700,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ));
            
  }
}

