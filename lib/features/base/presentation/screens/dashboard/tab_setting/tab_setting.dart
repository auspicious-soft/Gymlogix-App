import 'package:flutter/material.dart';
import 'package:gymlogix/generic_widgets/common_header.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/features/base/data/datasources/user_storage.dart';
import 'package:gymlogix/features/base/presentation/screens/about/pg_about.dart';
import 'package:gymlogix/features/authorisatiion/login/pg_login.dart';
import 'package:gymlogix/features/base/presentation/screens/membership/pg_membership.dart';
import 'package:gymlogix/features/base/presentation/screens/notificationsound/pg_notificationsound.dart';
import 'package:gymlogix/features/base/presentation/screens/workoutsetting/workoutsetting.dart';

class TabSetting extends StatefulWidget {
  const TabSetting({super.key});

  @override
  State<TabSetting> createState() => _TabSettingState();
}

class _TabSettingState extends State<TabSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonHeader(context, "Settings"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 58,
                            width: 58,
                            child: Image.asset(
                              AppAssets.program,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Label(
                                txt: "John Smith",
                                type: TextTypes.f_16_700,
                              ),
                              Label(
                                txt: "john.smith@gmail.com",
                                type: TextTypes.f_10_500,
                                forceColor: AppColors.privacyTxt,
                              ),
                            ]),
                      ]),
                      const Row(children: [
                        Icon(
                          Icons.qr_code_2_sharp,
                          size: 35,
                          color: AppColors.privacyTxt,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: AppColors.privacyTxt,
                        ),
                      ]),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    color: AppColors.lightGrey,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  child: Column(children: [
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PgMembership()),
                        )
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            SizedBox(
                              height: 18,
                              width: 18,
                              child: Image.asset(
                                AppAssets.membership,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Label(
                              txt: "Membership",
                              type: TextTypes.f_18_500,
                            ),
                          ]),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 10,
                            color: AppColors.privacyTxt,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PgNotificationsound()),
                        )
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            SizedBox(
                              height: 18,
                              width: 18,
                              child: Image.asset(
                                AppAssets.sound,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Label(
                              txt: "Sound & notifications",
                              type: TextTypes.f_18_500,
                            ),
                          ]),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 10,
                            color: AppColors.privacyTxt,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(
                            Icons.settings_outlined,
                            size: 25,
                            color: AppColors.privacyTxt,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Label(
                            txt: "General",
                            type: TextTypes.f_18_500,
                          ),
                        ]),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 10,
                          color: AppColors.privacyTxt,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Workoutsetting()),
                        )
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            SizedBox(
                              height: 18,
                              width: 18,
                              child: Image.asset(
                                AppAssets.workoutset,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Label(
                              txt: "Workout",
                              type: TextTypes.f_18_500,
                            ),
                          ]),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 10,
                            color: AppColors.privacyTxt,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          SizedBox(
                            height: 22,
                            width: 22,
                            child: Image.asset(
                              AppAssets.timer,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Label(
                            txt: "Timers",
                            type: TextTypes.f_18_500,
                          ),
                        ]),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 10,
                          color: AppColors.privacyTxt,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(
                            Icons.data_exploration_rounded,
                            size: 25,
                            color: AppColors.privacyTxt,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Label(
                            txt: "Data",
                            type: TextTypes.f_18_500,
                          ),
                        ]),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 10,
                          color: AppColors.privacyTxt,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(
                            Icons.help_outline_rounded,
                            size: 25,
                            color: AppColors.privacyTxt,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Label(
                            txt: "Help",
                            type: TextTypes.f_18_500,
                          ),
                        ]),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 10,
                          color: AppColors.privacyTxt,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PgAbout()),
                        )
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            SizedBox(
                              height: 18,
                              width: 18,
                              child: Image.asset(
                                AppAssets.about,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Label(
                              txt: "About",
                              type: TextTypes.f_18_500,
                            ),
                          ]),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 10,
                            color: AppColors.privacyTxt,
                          ),
                        ],
                      ),
                    )
                ,
                 const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () => {
                        UserStorage.con.deleteToken(),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PgLogin()),
                        )
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            SizedBox(
                              height: 18,
                              width: 18,
                              child: Image.asset(
                                AppAssets.logo,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Label(
                              txt: "Logout?",
                              type: TextTypes.f_18_500,
                            ),
                          ]),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 10,
                            color: AppColors.privacyTxt,
                          ),
                        ],
                      ),
                    )
                
                  ]),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
