import 'package:flutter/material.dart';
import 'package:gymlogix/generic_widgets/common_header.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gymlogix/app_settings/constants/app_dim.dart';

class TabStats extends StatefulWidget {
  const TabStats({super.key});

  @override
  State<TabStats> createState() => _TabStatsState();
}

class _TabStatsState extends State<TabStats> {
  final List<String> labels = ['7 Days', '31 Days', '12 Months', 'MAX'];
  final List<String> totals = [
    'Volume',
    'Total Reps',
    'Total Distance',
    'Total Duration'
  ];
  final List<String> totals2 = [
    'Duration',
    'Rest Time',
  ];
  final List<String> volumes = ['Sets', 'Volume', '1RM'];
  final List<Map<String, String>> timingData = [
    {
      "title": "1RM",
      "timing": "20kg",
    },
    {
      "title": "Max volume",
      "timing": "20kg",
    },
    {
      "title": "Shortest time",
      "timing": "10:00:00",
    },
    {
      "title": "Longest time",
      "timing": "23:00:00",
    },
  ];
  int selectedIndex = 0;
  int selectedVol = 0;
  int selectedTotal = 0;
  int selectedTotal2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(children: [
        commonHeader(context, "STATS"),
        Flexible(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(
                          txt: "Workout",
                          type: TextTypes.f_16_700,
                          forceColor: AppColors.whiteColor,
                        ),
                        Label(
                          txt: "-",
                          type: TextTypes.f_18_600,
                          forceColor: AppColors.whiteColor,
                        ),
                      ]),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDropdown("Plan"),
                        _buildDropdown("Workout"),
                        _buildDropdown("Exercise"),
                      ]),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: labels.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? AppColors.lightpink
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Label(
                                  txt: labels[index],
                                  type: TextTypes.f_14_500,
                                  forceColor: selectedIndex == index
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      children: [
                        Label(
                          txt: "Volume",
                          type: TextTypes.f_18_500,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.help,
                          size: 20,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Label(
                    txt: "The total number of reps multiplied by weight",
                    type: TextTypes.f_14_500,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: SizedBox(
                    height: 25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: totals.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTotal = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 1),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: selectedTotal == index
                                      ? AppColors.lightpink
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Label(
                                  txt: totals[index],
                                  type: TextTypes.f_10_500,
                                  forceColor: selectedTotal == index
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 1,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LineChart(
                    LineChartData(
                      minY: 0,
                      maxY: 5,
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey[300]!,
                            strokeWidth: 1,
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              return Label(
                                txt: "${value.toInt()}h",
                                type: TextTypes.f_12_500,
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              const days = [
                                "Mon",
                                "Tue",
                                "Wed",
                                "Thu",
                                "Fri",
                                "Sat",
                                "Sun"
                              ];

                              if (value.toInt() >= 0 &&
                                  value.toInt() < days.length) {
                                return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Label(
                                      txt: days[value.toInt()],
                                      type: TextTypes.f_12_500,
                                      forceColor: value == 2
                                          ? AppColors.red
                                          : AppColors.grey,
                                    ));
                              } else {
                                return const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: SizedBox.shrink());
                              }
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 3),
                            FlSpot(1, 2.5),
                            FlSpot(2, 3.2),
                            FlSpot(3, 2),
                            FlSpot(4, 4),
                            FlSpot(5, 3.5),
                            FlSpot(6, 4.5),
                          ],
                          isCurved: true,
                          color: AppColors.primaryColor,
                          barWidth: 3,
                          belowBarData: BarAreaData(
                            show: true,
                            color: AppColors.lightpink.withOpacity(0.2),
                          ),
                          dotData: FlDotData(
                            show: true,
                            checkToShowDot: (spot, barData) => spot.x == 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: timingData.length,
                      itemBuilder: (context, index) {
                        final item = timingData[index];
                        return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.lightGrey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Label(
                                    txt: item['title'] ?? "",
                                    type: TextTypes.f_12_500,
                                    forceColor: AppColors.grey,
                                  ),
                                  Label(
                                    txt: item['timing'] ?? "",
                                    type: TextTypes.f_16_500,
                                  ),
                                ])));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    color: AppColors.privacyTxt,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: volumes.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedVol = index;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Container(
                                width: 100,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: selectedVol == index
                                      ? AppColors.lightpink
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Label(
                                  txt: volumes[index],
                                  type: TextTypes.f_14_500,
                                  forceColor: selectedVol == index
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.lightpink,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Label(
                              txt: "Total",
                              type: TextTypes.f_14_500,
                              forceColor: AppColors.primaryColor),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.lightpink,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Label(
                              txt: "workout avg",
                              type: TextTypes.f_14_500,
                              forceColor: AppColors.primaryColor),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 18,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 250,
                    width: 285,
                    child: Image.asset(
                      AppAssets.body,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    color: AppColors.privacyTxt,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      children: [
                        Label(
                          txt: "Workout duration",
                          type: TextTypes.f_18_500,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.help,
                          size: 20,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Label(
                    txt: "Total workout duration",
                    type: TextTypes.f_14_500,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: SizedBox(
                    height: 25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: totals2.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTotal2 = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 1),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: selectedTotal2 == index
                                      ? AppColors.lightpink
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Label(
                                  txt: totals2[index],
                                  type: TextTypes.f_10_500,
                                  forceColor: selectedTotal2 == index
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: BarChart(
                      BarChartData(
                        barGroups: [
                          makeGroupData(0, 1),
                          makeGroupData(1, 4),
                          makeGroupData(2, 3),
                          makeGroupData(3, 4),
                          makeGroupData(4, 4),
                          makeGroupData(5, 3),
                          makeGroupData(6, 3),
                        ],
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                return Text('${value.toInt()}h');
                              },
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 0:
                                    return const Label(
                                      txt: 'Mon',
                                      type: TextTypes.f_12_500,
                                      forceColor: AppColors.grey,
                                    );
                                  case 1:
                                    return const Label(
                                      txt: 'Tue',
                                      type: TextTypes.f_12_500,
                                      forceColor: AppColors.grey,
                                    );

                                  case 2:
                                    return const Label(
                                      txt: 'Wed',
                                      type: TextTypes.f_12_500,
                                      forceColor: AppColors.primaryColor,
                                    );

                                  case 3:
                                    return const Label(
                                      txt: 'Thu',
                                      type: TextTypes.f_12_500,
                                      forceColor: AppColors.grey,
                                    );

                                  case 4:
                                    return const Label(
                                      txt: 'Fri',
                                      type: TextTypes.f_12_500,
                                      forceColor: AppColors.grey,
                                    );

                                  case 5:
                                    return const Label(
                                      txt: 'Sat',
                                      type: TextTypes.f_12_500,
                                    );

                                  case 6:
                                    return const Label(
                                      txt: 'Sun',
                                      type: TextTypes.f_12_500,
                                    );
                                  default:
                                    return Text('');
                                }
                              },
                            ),
                          ),
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                        ),
                        borderData: FlBorderData(show: false),
                        barTouchData: BarTouchData(enabled: false),
                        gridData: FlGridData(
                          drawHorizontalLine:
                              true, // Show horizontal grid lines
                          horizontalInterval: 1, // Spacing between grid lines
                          getDrawingHorizontalLine: (value) {
                            return const FlLine(
                              color: AppColors.lightGrey,
                              strokeWidth: 0.8,
                              dashArray: [4, 4],
                            );
                          },
                          drawVerticalLine: false,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(
                          txt: "Food Intake",
                          type: TextTypes.f_16_700,
                          forceColor: AppColors.whiteColor,
                        ),
                        Label(
                          txt: "-",
                          type: TextTypes.f_18_600,
                          forceColor: AppColors.whiteColor,
                        ),
                      ]),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(children: [
                    _buildDropdown("Plan"),
                    padHorizontal(10),
                    _buildDropdown("Meal"),
                  ]),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: labels.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? AppColors.lightpink
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Label(
                                  txt: labels[index],
                                  type: TextTypes.f_14_500,
                                  forceColor: selectedIndex == index
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 1,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LineChart(
                    LineChartData(
                      minY: 0,
                      maxY: 5,
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey[300]!,
                            strokeWidth: 1,
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              return Label(
                                txt: "${value.toInt()}h",
                                type: TextTypes.f_12_500,
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              const days = [
                                "Mon",
                                "Tue",
                                "Wed",
                                "Thu",
                                "Fri",
                                "Sat",
                                "Sun"
                              ];

                              if (value.toInt() >= 0 &&
                                  value.toInt() < days.length) {
                                return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Label(
                                      txt: days[value.toInt()],
                                      type: TextTypes.f_12_500,
                                      forceColor: value == 2
                                          ? AppColors.red
                                          : AppColors.grey,
                                    ));
                              } else {
                                return const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: SizedBox.shrink());
                              }
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 3),
                            FlSpot(1, 2.5),
                            FlSpot(2, 3.2),
                            FlSpot(3, 2),
                            FlSpot(4, 4),
                            FlSpot(5, 3.5),
                            FlSpot(6, 4.5),
                          ],
                          isCurved: true,
                          color: AppColors.primaryColor,
                          barWidth: 3,
                          belowBarData: BarAreaData(
                            show: true,
                            color: AppColors.lightpink.withOpacity(0.2),
                          ),
                          dotData: FlDotData(
                            show: true,
                            checkToShowDot: (spot, barData) => spot.x == 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Label(
                      txt: "Daily Average",
                      type: TextTypes.f_18_500,
                      forceColor: AppColors.grey,
                    )),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: timingData.length,
                      itemBuilder: (context, index) {
                        final item = timingData[index];
                        return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.lightGrey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Label(
                                    txt: item['title'] ?? "",
                                    type: TextTypes.f_12_500,
                                    forceColor: AppColors.grey,
                                  ),
                                  Label(
                                    txt: item['timing'] ?? "",
                                    type: TextTypes.f_16_500,
                                  ),
                                ])));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              height: 40,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Label(
                      txt: "Measurement",
                      type: TextTypes.f_16_700,
                      forceColor: AppColors.whiteColor,
                    ),
                    Label(
                      txt: "-",
                      type: TextTypes.f_18_600,
                      forceColor: AppColors.whiteColor,
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(children: [
                _buildDropdown2("", context),
                padHorizontal(10),
              ]),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: labels.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? AppColors.lightpink
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Label(
                              txt: labels[index],
                              type: TextTypes.f_14_500,
                              forceColor: selectedIndex == index
                                  ? AppColors.primaryColor
                                  : AppColors.blackColor,
                            ),
                          ),
                        ));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width / 1,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LineChart(
                LineChartData(
                  minY: 0,
                  maxY: 5,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey[300]!,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          return Label(
                            txt: "${value.toInt()}h",
                            type: TextTypes.f_12_500,
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          const days = [
                            "Mon",
                            "Tue",
                            "Wed",
                            "Thu",
                            "Fri",
                            "Sat",
                            "Sun"
                          ];

                          if (value.toInt() >= 0 &&
                              value.toInt() < days.length) {
                            return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Label(
                                  txt: days[value.toInt()],
                                  type: TextTypes.f_12_500,
                                  forceColor: value == 2
                                      ? AppColors.red
                                      : AppColors.grey,
                                ));
                          } else {
                            return const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: SizedBox.shrink());
                          }
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(1, 2.5),
                        FlSpot(2, 3.2),
                        FlSpot(3, 2),
                        FlSpot(4, 4),
                        FlSpot(5, 3.5),
                        FlSpot(6, 4.5),
                      ],
                      isCurved: true,
                      color: AppColors.primaryColor,
                      barWidth: 3,
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.lightpink.withOpacity(0.2),
                      ),
                      dotData: FlDotData(
                        show: true,
                        checkToShowDot: (spot, barData) => spot.x == 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Align(
                alignment: Alignment.center,
                child: Label(
                  txt: " Tue Aug 24, 2024 15:35",
                  type: TextTypes.f_18_500,
                )),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: timingData.length,
                  itemBuilder: (context, index) {
                    final item = timingData[index];
                    return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.lightGrey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Label(
                                txt: item['title'] ?? "",
                                type: TextTypes.f_12_500,
                                forceColor: AppColors.grey,
                              ),
                              Label(
                                txt: item['timing'] ?? "",
                                type: TextTypes.f_16_500,
                              ),
                            ])));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
          ],
        )))
      ]),
    );
  }

  Widget _buildDropdown(String label) {
    return Column(
      children: [
        Label(
          txt: label,
          type: TextTypes.f_16_700,
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButton<String>(
            value: null,
            hint: const Text("Select"),
            icon: const Icon(Icons.arrow_drop_down),
            underline: const SizedBox(),
            onChanged: (String? newValue) {},
            items: <String>['Option 1', 'Option 2', 'Option 3']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

Widget _buildDropdown2(String label, context) {
  return Column(
    children: [
      Label(
        txt: label,
        type: TextTypes.f_16_700,
      ),
      const SizedBox(height: 5),
      Container(
        width: MediaQuery.of(context).size.width / 1.2,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButton<String>(
          value: null,
          hint: const Text("Select"),
          icon: const Icon(Icons.arrow_drop_down),
          underline: const SizedBox(),
          onChanged: (String? newValue) {},
          items: <String>['Option 1', 'Option 2', 'Option 3']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    ],
  );
}

BarChartGroupData makeGroupData(int x, double y) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        color: Colors.grey[300],
        width: 16,
        borderRadius: BorderRadius.zero,
      ),
    ],
  );
}
