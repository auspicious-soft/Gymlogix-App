import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/Models/model_view.dart';

import 'package:gymlogix/generic_widgets/common_header.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/base/data/datasources/user_storage.dart';
import 'package:gymlogix/features/base/presentation/screens/LogWorkoutStart/pg_logworkoutstart.dart';
import 'package:gymlogix/features/base/presentation/screens/dashboard/tab_home/widget_allplans.dart';
import 'package:gymlogix/features/base/presentation/screens/logfoodstart/pg_logfoodstart.dart';
import 'package:gymlogix/features/base/presentation/screens/logmeal/pg_logmeal.dart';
import 'package:gymlogix/features/base/presentation/screens/logmeasurement/pg_logmeasurement.dart';
import 'package:gymlogix/features/base/presentation/screens/notes/pg_notes.dart';
import 'package:gymlogix/features/base/presentation/screens/viewfood/pg_viewfood.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../../data/datasources/network_error.dart';
import '../../../providers/plans_provider.dart';

class TabHome extends ConsumerStatefulWidget {
  final ModelView homeScreenData;
  const TabHome({super.key, required this.homeScreenData});
  @override
  ConsumerState<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends ConsumerState<TabHome> {
  late ModelView _homeScreenData;
  late final ValueNotifier<DateTime> _selectedDay;
  late final CalendarFormat _calendarFormat;

  @override
  void initState() {
    super.initState();
    _selectedDay = ValueNotifier(DateTime.now());
    _calendarFormat = CalendarFormat.month;
    _homeScreenData = widget.homeScreenData;
    getToken();
    // Future.delayed(Duration.zero).then(
    //     (_)   {

    //     ref.read(stateGetPlanProvider.notifier).getPlanData( context: context);
    //     }
    //   );
  }

  void getPlans() async {}
  void getToken() async {
    final tkn = await UserStorage.con.getToken();

    print(tkn);
  }

  @override
  void dispose() {
    _selectedDay.dispose();
    super.dispose();
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
    //final stateGetPlans = ref.watch(stateGetPlanProvider);

    final exerciseData = _homeScreenData.schedule.isNotEmpty
        ? _homeScreenData.schedule[0].content.exercises
        : [];

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          commonHeader(context, "HOME"),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Calendar
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

                  //Task list
                  // stateGetPlans.maybeWhen(
                  //   orElse: () {
                  //     return CircularProgressIndicator();
                  //   },
                  //   data: (data) {
                  //     print("Gymdata ${data}");
                  //     return Text(data == null
                  //         ? "failed"
                  //         : "success"); //WidgetAllplans(plans: data!.data);
                  //   },
                  //   loading: () {
                  //     return CircularProgressIndicator();
                  //   },
                  //   error: (error, stackTrace) {
                  //     return Center(
                  //       child: ElevatedButton(
                  //           onPressed: () {}, child: Text(error.toString())),
                  //     );
                  //   },
                  // )

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: exerciseData.length,
                    itemBuilder: (context, index) {
                      final exercise = exerciseData[index];
                      final finishAt = exercise.finishAt;
                      final formattedDate = _formatDate(finishAt);
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Label(
                                  txt: formattedDate,
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
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Label(
                                              txt: formattedDate,
                                              type: TextTypes.f_13_700,
                                              forceColor: AppColors.grey,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              child: Label(
                                                txt: exercise.comments,
                                                type: TextTypes.f_15_700,
                                              ),
                                            )
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
