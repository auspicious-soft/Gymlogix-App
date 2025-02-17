import 'dart:math';
import 'package:flutter/material.dart';

import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/components/widget_global_margin.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/generic_widgets/common_button.dart';
import 'package:gymlogix/features/base/presentation/screens/customplans/pg_customplans.dart';
import 'package:gymlogix/features/base/presentation/screens/dashboard/pg_dashboard.dart';

class PgBestprograms extends StatefulWidget {
  const PgBestprograms({super.key});

  @override
  State<PgBestprograms> createState() => _PgBestprogramsState();
}

class _PgBestprogramsState extends State<PgBestprograms>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Fireworks animation layer

            // Main UI content
            WidgetGlobalMargin(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Label(
                      txt: "We found a program for you",
                      type: TextTypes.f_32_900,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 103,
                        width: 100,
                        child: Image.asset(
                          AppAssets.program,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Label(
                                txt: "Upper Lower program",
                                type: TextTypes.f_12_700,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Label(
                              txt:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                              type: TextTypes.f_10_500,
                              forceColor: AppColors.privacyTxt,
                            ),
                            const SizedBox(height: 5),
                            Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PgCustomplans(),
                                    ),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Label(
                                    txt: 'Details',
                                    type: TextTypes.f_12_700,
                                    forceColor: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 16,
              left: 15,
              right: 15,
              child: SizedBox(
                width: double.infinity,
                child: commonButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PgDashBoard(),
                      ),
                    );
                  },
                  txt: "Skip",
                  context: context,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FireworksPainter extends CustomPainter {
  final double animationValue;

  FireworksPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      ..color = Colors.white;

    final centerX = size.width / 2;
    final centerY = size.height / 1.6;
    final random = Random();

    for (int i = 0; i < 100; i++) {
      final angle = random.nextDouble() * 2 * pi;
      final distance = random.nextDouble() * 100;
      final x = centerX + distance * cos(angle) * animationValue;
      final y = centerY + distance * sin(angle) * animationValue;

      // Change the color over time
      paint.color = Color.lerp(
          Colors.red, Colors.yellow, animationValue * random.nextDouble())!;

      canvas.drawCircle(Offset(x, y), 4, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
