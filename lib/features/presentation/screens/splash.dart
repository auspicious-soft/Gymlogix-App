import 'package:flutter/material.dart';

import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/features/data/datasources/user_storage.dart';
import 'package:gymlogix/features/presentation/screens/dashboard/pg_dashboard.dart';
import 'package:gymlogix/features/presentation/screens/onboarding/pg_onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    inIt();
  }

  void inIt() async {
    // UserStorage.con.deleteToken();
    final token = await UserStorage.con.getToken();

    if (token.isEmpty) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PgOnboarding()),
        );
      });
      print("on");
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PgDashBoard()),
        );
      });
      print("dash");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.asset(
            AppAssets.splashimg,
            height: MediaQuery.of(context).size.height,
          )),
        ],
      ),
    );
  }
}
