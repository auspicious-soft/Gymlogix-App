import 'package:flutter/material.dart';

import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';

class InsightItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final int likes;
  final String formattedDate;

  const InsightItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.imageUrl,
    required this.likes,
    required this.formattedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: Image.asset(
                    AppAssets.program,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label(
                    txt: title,
                    type: TextTypes.f_15_500,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: Label(
                      txt: subtitle,
                      type: TextTypes.f_12_500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.3,
          width: double.infinity,
          child: Image.network(
            imageUrl ??
                'https://gylogix.s3.us-east-1.amazonaws.com/insights/squat_1.png',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset(
                  AppAssets.heart,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Label(
              txt: '$likes',
              type: TextTypes.f_12_500,
            ),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: Label(
              txt: formattedDate,
              type: TextTypes.f_12_500,
              forceColor: AppColors.grey,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 1,
          decoration: const BoxDecoration(
            color: AppColors.lightGrey,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
