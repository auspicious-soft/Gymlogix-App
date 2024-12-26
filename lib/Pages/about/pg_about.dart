import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

class PgAbout extends StatefulWidget {
  const PgAbout({super.key});

  @override
  State<PgAbout> createState() => _PgAboutState();
}

class _PgAboutState extends State<PgAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header section
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
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Label(
                              txt: "About",
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
            // Settings list
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildButtonTile(
                  title: "Verion",
                  trailing: const Label(
                    txt: "1.1.0",
                    type: TextTypes.f_16_500,
                  ),
                  onTap: () {
                    // Navigate to the weight increment page
                  },
                ),
                _buildButtonTile(
                  title: "Rate on google play",
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.lightGrey,
                    size: 30,
                  ),
                  onTap: () {},
                ),
                _buildButtonTile(
                  title: "Share link",
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.lightGrey,
                    size: 30,
                  ),
                  onTap: () {},
                ),
                _buildButtonTile(
                  title: "Help and FAQ",
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.lightGrey,
                    size: 30,
                  ),
                  onTap: () {},
                ),
                _buildButtonTile(
                  title: "Suggestions",
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.lightGrey,
                    size: 30,
                  ),
                  onTap: () {},
                ),
                _buildButtonTile(
                  title: "Privacy policy",
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.lightGrey,
                    size: 30,
                  ),
                  onTap: () {},
                ),
                _buildButtonTile(
                  title: "After working set time",
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.lightGrey,
                    size: 30,
                  ),
                  onTap: () {},
                ),
                _buildButtonTile(
                  title: "After finishing excercise",
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.lightGrey,
                    size: 30,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonTile({
    required String title,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      child: SizedBox(
          height: 50,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
              decoration: const BoxDecoration(
                color: AppColors.backgroundgrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(
                    txt: title,
                    type: TextTypes.f_16_500,
                  ),
                  trailing,
                ],
              ),
            ),
          )),
    );
  }
}
