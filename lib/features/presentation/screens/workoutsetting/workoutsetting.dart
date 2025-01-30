import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

class Workoutsetting extends StatefulWidget {
  const Workoutsetting({super.key});

  @override
  State<Workoutsetting> createState() => _WorkoutsettingState();
}

class _WorkoutsettingState extends State<Workoutsetting> {
  bool disableSilentMode = false;
  bool autoNextExercise = false;

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
            // Settings list
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildButtonTile(
                  title: "Disable Silent mode",
                  trailing: _buildSwitch(disableSilentMode, (value) {
                    setState(() {
                      disableSilentMode = value;
                    });
                  }),
                ),
                _buildButtonTile(
                  title: "Auto next exercise",
                  trailing: _buildSwitch(autoNextExercise, (value) {
                    setState(() {
                      autoNextExercise = value;
                    });
                  }),
                ),
                _buildButtonTile(
                  title: "Weight increment (kg)",
                  trailing: const Label(
                    txt: "1kg",
                    type: TextTypes.f_16_500,
                  ),
                  onTap: () {
                    // Navigate to the weight increment page
                  },
                ),
                _buildButtonTile(
                  title: "Weight increment (lb)",
                  trailing: const Label(
                    txt: "1lb",
                    type: TextTypes.f_16_500,
                  ),
                  onTap: () {
                    // Navigate to the weight increment page
                  },
                ),
                _buildButtonTile(
                  title: "Time increasement",
                  trailing: const Label(
                    txt: "1min",
                    type: TextTypes.f_16_500,
                  ),
                  onTap: () {
                    // Navigate to time increment page
                  },
                ),
                _buildButtonTile(
                  title: "Distance increment (km)",
                  trailing: const Label(
                    txt: "100m",
                    type: TextTypes.f_16_500,
                  ),
                  onTap: () {},
                ),
                _buildButtonTile(
                  title: "Distance increment (miles)",
                  trailing: const Label(
                    txt: "¼ mi",
                    type: TextTypes.f_16_500,
                  ),
                  onTap: () {},
                ),
                _buildButtonTile(
                  title: "Default warm-up time",
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
                  title: "After finishing exercise",
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

  Widget _buildSwitch(bool value, ValueChanged<bool> onChanged) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: AppColors.green,
    );
  }
}
