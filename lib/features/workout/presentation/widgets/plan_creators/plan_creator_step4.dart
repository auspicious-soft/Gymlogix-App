
import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';

class PlanCreatorStep4 extends StatelessWidget {
  const PlanCreatorStep4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15, vertical: 15),
        child: Column(
          children: [
            const Label(
              txt: "Descripe the program in details",
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
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.lightGrey),
              ),
              child: const TextField(
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: "Type a detail",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: AppConst.fontFamily),
                textInputAction: TextInputAction.done,
                maxLines: null,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Label(
              txt: "Instruction and tips for the program",
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
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.lightGrey),
              ),
              child: const TextField(
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: "Type a detail",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: AppConst.fontFamily),
                textInputAction: TextInputAction.done,
                maxLines: null,
              ),
            ),
          ],
        ));
  }
}
