import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_dim.dart';
import 'package:gymlogix/features/helpers/global_widgets/common_button.dart';
import 'package:gymlogix/features/workout/presentation/create_workout/add/pg_addworkout.dart';
import 'package:gymlogix/features/helpers/global_widgets/program_header.dart';
import 'package:gymlogix/features/workout/presentation/create_workout/create/plan_creators/program_name_editor.dart';
import 'plan_creators/Program_level_chooser.dart';
import 'plan_creators/program_day_counter.dart';
import 'plan_creators/program_goal_selector.dart';
import 'plan_creators/program_locator.dart';
import 'plan_creators/program_detail_editor.dart';
import '../../widgets/plan_header.dart';

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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: commonButton(
          txt: "Next",
          context: context,
          onPressed: () => {
            togglePage(youWantForward: true)},
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
            child: Column(children: [
          PlanPageHeader(
            title: "Customise workout plan",
            onBackPress: () {
              if (activeIndex == 1) {
                Navigator.pop(context);
              } else {
                togglePage(youWantForward: false);
              }
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProgramHeader(
                  topTitle: "Start building your program",
                  subTitleLeft: "PPL Bulking"),
              padVertical(60),
              if (activeIndex == 1)
                ProgramNameEditor(
                    title: "Give a meaningful name for your program",
                    fieldController: nameController!),
              if (activeIndex == 2) const ProgramGoalSelector(),
              if (activeIndex == 3) const ProgramLocator(),
              if (activeIndex == 4) const ProgramDetailEditor(),
              if (activeIndex == 5) const ProgramDayCounter(),
              if (activeIndex == 6) const ProgramLevelChooser(),

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
  void togglePage({required bool youWantForward}) {
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
          activeIndex = youWantForward ? activeIndex + 1 : activeIndex - 1;
        });
      }
    }
  }
}
