import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

class ProgramHeader extends StatelessWidget{
   final String topTitle;
  final String subTitleLeft;

  const ProgramHeader({super.key,required this.topTitle,required this.subTitleLeft});
 

  @override
  Widget build(BuildContext context) {
return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                height: 176,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.grey,
                ),
                child: Stack(
                  children: [
                    const Align(
                        alignment: Alignment.topCenter,
                        child: Label(
                          txt: "Start building your program",
                          type: TextTypes.f_20_900i,
                          forceColor: AppColors.whiteColor,
                        )),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Label(
                            txt: "PPL Bulking",
                            type: TextTypes.f_16_700,
                            forceColor: AppColors.whiteColor,
                          ),
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: Image.asset(
                              AppAssets.edit,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            

   return  Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              height: 176,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.grey,
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Label(
                          txt: "PPL Bulking",
                          type: TextTypes.f_16_700,
                          forceColor: AppColors.whiteColor,
                        ),
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: Image.asset(
                            AppAssets.edit,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
        
  }

  
}