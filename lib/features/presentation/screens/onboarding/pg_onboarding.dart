import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';

import 'package:gymlogix/app_settings/constants/common_button.dart';
import 'package:gymlogix/features/presentation/screens/login/pg_login.dart';
import 'package:gymlogix/features/presentation/screens/selectgoals/select_goals.dart';

class PgOnboarding extends StatefulWidget {
  const PgOnboarding({super.key});

  @override
  State<PgOnboarding> createState() => _PgOnboardingState();
}

class _PgOnboardingState extends State<PgOnboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.backgroudimg,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Label(
                      txt: "Fuel Your Goals Measure Your Gains",
                      type: TextTypes.f_32_900,
                    )),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Label(
                    txt:
                        "This is sub text and its meant to give more information about the app",
                    type: TextTypes.f_16_700,
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                  child: Image.asset(
                    AppAssets.logo,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 60),
                commonButton(
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PgSelectGoals()),
                          )
                        },
                    txt: "Get Started",
                    context: context),
                const SizedBox(height: 20),
                commonButton2(
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PgLogin()),
                          )
                        },
                    txt: "Login",
                    context: context),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
