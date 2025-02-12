
 
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import  'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
 

class PlanCreatorStep1 extends StatelessWidget {
  
  final String title;
  final TextEditingController fieldController;
  const PlanCreatorStep1({
    super.key,
    required this.title,
    required this.fieldController
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          const Label(
            txt: "Give a meanigull name for your program",
            type: TextTypes.f_14_700,
            forceColor: AppColors.primaryColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            height: 54,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.lightGrey),
            ),
            child:   TextField(
              controller: fieldController,
              textAlignVertical: TextAlignVertical.top,
              decoration: const InputDecoration(
                hintText: "Type  name for your program",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: AppConst.fontFamily),
              textInputAction: TextInputAction.done,
              maxLines: null,
            ),
          )
        ]));
  }
}

