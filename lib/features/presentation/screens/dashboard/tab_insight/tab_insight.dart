import 'package:flutter/material.dart';
import 'package:gymlogix/Models/model_view.dart';

import 'package:gymlogix/Widgets/common_header.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/features/presentation/screens/dashboard/tab_insight/Widgets/insight_card.dart';

class TabInsight extends StatefulWidget {
  final ModelView insightScreenData;
  const TabInsight({Key? key, required this.insightScreenData});

  @override
  State<TabInsight> createState() => _TabInsightState();
}

class _TabInsightState extends State<TabInsight> {
  late ModelView _InsightData;

  @override
  void initState() {
    super.initState();

    _InsightData = widget.insightScreenData;
  }

  String _formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      final formattedDate =
          "${_getWeekday(parsedDate.weekday)} ${parsedDate.month} ${parsedDate.day}, ${parsedDate.year}";
      return formattedDate;
    } catch (e) {
      return 'Invalid Date';
    }
  }

  String _getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          commonHeader(context, "INSIGHT"),
          Expanded(
            child: ListView.builder(
              itemCount: _InsightData.insight.length,
              itemBuilder: (context, index) {
                final insight = _InsightData.insight[index];
                final formattedDate = _formatDate(insight.createdAt);

                return InsightItem(
                  title: insight.title,
                  subtitle: insight.subtitle,
                  imageUrl: insight.imageUrl,
                  likes: insight.like,
                  formattedDate: formattedDate,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
