import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

class PgNotificationsound extends StatefulWidget {
  const PgNotificationsound({super.key});

  @override
  State<PgNotificationsound> createState() => _PgNotificationsoundState();
}

class _PgNotificationsoundState extends State<PgNotificationsound> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
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
                    padding:
                        const EdgeInsets.only(top: 60, left: 15, right: 15),
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
                              txt: "Sound & notification",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Label(
                      txt: "Notifications",
                      type: TextTypes.f_18_500,
                    ),
                    Switch(
                      value: isSwitched,
                      activeColor: AppColors.green,
                      inactiveTrackColor: AppColors.grey,
                      inactiveThumbColor: AppColors.whiteColor,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Label(
                      txt: "Number selection",
                      type: TextTypes.f_18_500,
                    ),
                    Label(
                      txt: "3 ",
                      type: TextTypes.f_18_500,
                    ),
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Label(
                      txt: "dropbox",
                      type: TextTypes.f_18_500,
                    ),
                    Label(
                      txt: "Strength",
                      type: TextTypes.f_18_500,
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
