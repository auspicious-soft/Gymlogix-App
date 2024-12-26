import 'package:flutter/material.dart';
import 'package:gymlogix/Pages/LogWorkoutStart/pg_logworkoutstart.dart';
import 'package:gymlogix/Pages/logfoodstart/pg_logfoodstart.dart';
import 'package:gymlogix/Pages/logmeal/pg_logmeal.dart';
import 'package:gymlogix/Pages/logmeasurement/pg_logmeasurement.dart';
import 'package:gymlogix/Pages/notes/pg_notes.dart';
import 'package:gymlogix/Pages/viewfood/pg_viewfood.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});
  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  late final ValueNotifier<DateTime> _selectedDay;
  late final CalendarFormat _calendarFormat;

  @override
  void initState() {
    super.initState();
    _selectedDay = ValueNotifier(DateTime.now());
    _calendarFormat = CalendarFormat.month;
  }

  @override
  void dispose() {
    _selectedDay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
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
                  padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          SizedBox(width: 10),
                          Label(
                            txt: "HOME",
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.primaryColor,
                    padding: const EdgeInsets.all(18),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: DateTime.now(),
                      calendarFormat: _calendarFormat,
                      selectedDayPredicate: (day) =>
                          isSameDay(day, _selectedDay.value),
                      onDaySelected: (selectedDay, focusedDay) {
                        _showDetailsModal(context);
                        setState(() {
                          _selectedDay.value = selectedDay;
                        });
                      },
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                      calendarStyle: const CalendarStyle(
                        defaultTextStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                        ),
                        weekendTextStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                        ),
                        todayDecoration: BoxDecoration(
                          color: AppColors.green,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: AppColors.blackColor,
                          shape: BoxShape.circle,
                        ),
                        markerDecoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      headerStyle: const HeaderStyle(
                        titleCentered: false,
                        formatButtonVisible: false,
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                        titleTextStyle: TextStyle(
                          fontFamily: AppConst.fontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                        ),
                        weekendStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              if (index == 0)
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Label(
                                    txt: "Tue Aug 24, 2024",
                                    type: TextTypes.f_16_700,
                                  ),
                                ),
                              const SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                  onTap: () => {
                                        if (index == 0)
                                          {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PgLogmeal()),
                                            )
                                            // _showDetailsModal(context)
                                          }
                                        else if (index == 1)
                                          {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PgViewfood()),
                                            )
                                          }
                                        else if (index == 2)
                                          {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PgLogmeasurement()),
                                            )
                                          }
                                      },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    height: 84,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: AppColors.lightGrey),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 55,
                                          width: 55,
                                          child: Image.asset(
                                            AppAssets.dumbel,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Label(
                                              txt: "Tue Aug 24, 2024 15:35",
                                              type: TextTypes.f_13_700,
                                              forceColor: AppColors.grey,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Label(
                                              txt:
                                                  "Pushups for 2 sets of 10 reps",
                                              type: TextTypes.f_15_700,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        iconTheme: const IconThemeData(size: 30),
        activeIcon: Icons.close,
        backgroundColor: AppColors.primaryColor,
        overlayOpacity: 0.4,
        overlayColor: Colors.black,
        foregroundColor: Colors.white,
        spaceBetweenChildren: 10,
        children: [
          SpeedDialChild(
            child: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset(
                AppAssets.note,
                fit: BoxFit.contain,
              ),
            ),
            label: 'Notes',
            labelStyle: const TextStyle(
                fontSize: 14,
                fontFamily: AppConst.fontFamily,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PgNotes()),
              );
            },
          ),
          SpeedDialChild(
            child: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset(
                AppAssets.measure,
                fit: BoxFit.contain,
              ),
            ),
            label: 'Measurement',
            labelStyle: const TextStyle(
                fontSize: 14,
                fontFamily: AppConst.fontFamily,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PgLogmeasurement()),
              );
            },
          ),
          SpeedDialChild(
            child: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset(
                AppAssets.food,
                fit: BoxFit.contain,
              ),
            ),
            label: 'Food intake',
            labelStyle: const TextStyle(
                fontSize: 14,
                fontFamily: AppConst.fontFamily,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const PgViewfood()),
              // );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PgLogfoodstart()),
              );
            },
          ),
          SpeedDialChild(
            label: 'Workout',
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                AppAssets.dumbel2,
                fit: BoxFit.contain,
              ),
            ),
            labelStyle: const TextStyle(
                fontSize: 14,
                fontFamily: AppConst.fontFamily,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PgLogworkoutstart()),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showDetailsModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            // height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.width - 30,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Label(txt: "Tue Jun 23, 2024", type: TextTypes.f_16_700),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                                child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              height: 84,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: AppColors.lightGrey),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 55,
                                    width: 55,
                                    child: Image.asset(
                                      AppAssets.dumbel,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Label(
                                        txt: "Tue Aug 24, 2024 15:35",
                                        type: TextTypes.f_13_700,
                                        forceColor: AppColors.grey,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Label(
                                        txt: "Pushups for 2 sets of 10 reps",
                                        type: TextTypes.f_15_700,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ));
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        AppAssets.note,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        AppAssets.dumbel2,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        AppAssets.food,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        AppAssets.measure,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
    );
  }
}
