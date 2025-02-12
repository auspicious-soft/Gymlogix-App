import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_dim.dart';
import 'package:gymlogix/features/global_widgets/common_button.dart';
import 'package:gymlogix/features/base/presentation/screens/CreateExerciseStack/AddWorkout/pg_addworkout.dart';
import 'package:gymlogix/features/global_widgets/program_header.dart';
import 'package:gymlogix/features/workout/presentation/widgets/plan_creators/plan_creator_step1.dart';
import 'widgets/plan_creators/plac_creator_step6.dart';
import 'widgets/plan_creators/plan_creator_step5.dart';
import 'widgets/plan_creators/plan_creator_step2.dart';
import 'widgets/plan_creators/plan_creator_step3.dart';
import 'widgets/plan_creators/plan_creator_step4.dart';
import 'widgets/plan_header.dart';

class PgCreateWorkout extends ConsumerStatefulWidget {
  const PgCreateWorkout({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _StatePgCreateWorkout();
  }
}

class _StatePgCreateWorkout extends ConsumerState<PgCreateWorkout> {
  int activeIndex = 1;
  TextEditingController? nameController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
      floatingActionButton:   commonButton(
                txt: "Next",
                context: context,
                onPressed: () => {togglePage()},
              ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
            child: Column(children: [
          const PlanPageHeader(
            title: "Customise workout plan",
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProgramHeader(
                  topTitle: "Start building your program",
                  subTitleLeft: "PPL Bulking"),
              padVertical(60),
              if (activeIndex == 1)
                PlanCreatorStep1(
                    title: "Give a meaningful name for your program",
                    fieldController: nameController!),
              if (activeIndex == 2) const PlanCreatorStep2(),
              if (activeIndex == 3) const PlanCreatorStep3(),
              if (activeIndex == 4) const PlanCreatorStep4(),
              if (activeIndex == 5) const PlanCreatorStep5(),
              if (activeIndex == 6) const PlanCreatorStep6(),
             
              // commonButton(
              //   txt: "Next",
              //   context: context,
              //   onPressed: () => {togglePage()},
              // ),
              const SizedBox(height: 20),
            ],
          ),
        ])));
  }
//Methods
  void togglePage() {
    if (activeIndex == 6) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PgAddworkout()),
      );
    } else {
      var calculate = true;
      if (activeIndex == 1) {
        if (nameController!.text.isEmpty) {
          calculate = false;
        }
      }
      if (calculate) {
        setState(() {
          activeIndex = activeIndex + 1;
        });
      }
    }
  }
}
