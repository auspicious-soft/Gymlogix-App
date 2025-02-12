import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/features/global_widgets/common_button.dart';
import 'package:gymlogix/features/base/presentation/screens/CraeteWokoutLog/pg_createworkoutlog.dart';
import 'package:gymlogix/features/base/presentation/screens/dashboard/pg_dashboard.dart';

class PgLogworkoutstart extends StatefulWidget {
  const PgLogworkoutstart({super.key});

  @override
  State<PgLogworkoutstart> createState() => _PgLogworkoutstartState();
}

class _PgLogworkoutstartState extends State<PgLogworkoutstart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppAssets.background,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => {Navigator.pop(context)},
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Label(
                            txt: "Workout",
                            type: TextTypes.f_16_700,
                            forceColor: AppColors.whiteColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: Image.asset(
                          AppAssets.bellicon,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Label(
                txt: "It seems you do not have active food program",
                type: TextTypes.f_20_500i,
                forceColor: AppColors.grey,
                forceAlignment: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              commonButton(
                txt: "Create new program",
                context: context,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PgCreateworkoutlog()),
                  ),
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Label(
                txt: "OR",
                type: TextTypes.f_20_500i,
                forceColor: AppColors.grey,
                forceAlignment: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              commonButton(
                  txt: "Check our list",
                  context: context,
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PgDashBoard(
                                initialTabIndex:
                                    1), // Pass 1 to select the TabPlan
                          ),
                        )
                      },
                  forceColor: AppColors.pink),
            ],
          ))
        ],
      ),
    );
  }
}
