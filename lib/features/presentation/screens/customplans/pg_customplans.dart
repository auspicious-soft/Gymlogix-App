import 'package:flutter/material.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_assets.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/common_button.dart';
import 'package:gymlogix/features/presentation/screens/dashboard/pg_dashboard.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';

class PgCustomplans extends StatefulWidget {
  const PgCustomplans({super.key});

  @override
  State<PgCustomplans> createState() => _PgCustomplansState();
}

class _PgCustomplansState extends State<PgCustomplans> {
  late final ValueNotifier<DateTime> _selectedDay;
  late final CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  int activeIndex = 0;
  bool chatvis = true;
  bool _isExpanded = false;
  final List<Map<String, dynamic>> messages = [
    {"text": "you will have to do hard", "isUser": false},
    {"text": "How do I work the bench press", "isUser": true},
  ];
  @override
  void initState() {
    super.initState();
    _selectedDay = ValueNotifier(DateTime.now());

    _focusedDay = DateTime.now();
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
                              txt: "Custom workout plan",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  height: 146,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.grey,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Column(
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
                            const Label(
                              txt: "PPL Bulking",
                              type: TextTypes.f_16_700,
                              forceColor: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40,
                            child: Label(
                              txt: "3",
                              type: TextTypes.f_32_700,
                              forceColor: AppColors.primaryColor,
                            ),
                          ),
                          Label(
                            txt: "Days",
                            type: TextTypes.f_10_500,
                            forceColor: AppColors.privacyTxt,
                          ),
                        ],
                      ),
                      GestureDetector(
                          onTap: () => {_showDetailsModal(context)},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 30,
                                width: 35,
                                child: Image.asset(
                                  AppAssets.edurance,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Label(
                                txt: "Endurance",
                                type: TextTypes.f_10_500,
                                forceColor: AppColors.privacyTxt,
                              ),
                            ],
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 36,
                            child: Image.asset(
                              AppAssets.home,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Label(
                            txt: "Home",
                            type: TextTypes.f_10_500,
                            forceColor: AppColors.privacyTxt,
                          ),
                        ],
                      ),
                      GestureDetector(
                          onTap: () => {_showCalendarModal(context)},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 36,
                                width: 36,
                                child: Image.asset(
                                  AppAssets.calender,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Label(
                                txt: "12 Weeks",
                                type: TextTypes.f_10_500,
                                forceColor: AppColors.privacyTxt,
                              ),
                            ],
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 32,
                            width: 50,
                            child: Image.asset(
                              AppAssets.rating,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Label(
                            txt: "Beginners",
                            type: TextTypes.f_10_500,
                            forceColor: AppColors.privacyTxt,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () => {
                      setState(() {
                        activeIndex = 0;
                      })
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: 35,
                      decoration: BoxDecoration(
                        color: activeIndex == 0
                            ? AppColors.lightpink
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Label(
                            txt: "Details",
                            type: TextTypes.f_14_500,
                            forceColor: activeIndex == 0
                                ? AppColors.primaryColor
                                : AppColors.blackColor,
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => {
                      setState(() {
                        activeIndex = 1;
                      })
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: 35,
                      decoration: BoxDecoration(
                        color: activeIndex == 1
                            ? AppColors.lightpink
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Label(
                            txt: "Instructions",
                            type: TextTypes.f_14_500,
                            forceColor: activeIndex == 1
                                ? AppColors.primaryColor
                                : AppColors.blackColor,
                          )),
                    ),
                  )
                ]),
                const SizedBox(
                  height: 20,
                ),
                // Description Text
                Padding(
                  padding: EdgeInsets.all(15),
                  child: SizedBox(
                    // width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align content to the start
                      children: [
                        Label(
                          txt: _isExpanded
                              ? "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type."
                              : "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                          type: TextTypes.f_18_500,
                          forceColor: AppColors.grey,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                          child: Label(
                            txt: _isExpanded ? "READ LESS" : "READ MORE",
                            type: TextTypes.f_18_600,
                            forceColor: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 250,
                  width: 285,
                  child: Image.asset(
                    AppAssets.body,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: const Label(
                    txt: "Associated food plan",
                    type: TextTypes.f_18_500,
                    forceColor: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 84,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
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
                      const Label(
                        txt: "Bulking 12 weeks",
                        type: TextTypes.f_15_500,
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(height: 70),
                GestureDetector(
                  onTap: () => {
                    setState(() {
                      chatvis = !chatvis;
                    })
                  },
                  child: Container(
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
                            txt: "Discussion",
                            type: TextTypes.f_18_500,
                            forceColor: AppColors.whiteColor),
                        Label(
                            txt: "-",
                            type: TextTypes.f_18_600,
                            forceColor: AppColors.whiteColor),
                      ],
                    ),
                  ),
                ),
                if (chatvis == true)
                  SizedBox(
                      height: 300,
                      child: (ListView.builder(
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          final isUser = message["isUser"] as bool;
                          return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: isUser
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      decoration: BoxDecoration(
                                        color: isUser
                                            ? AppColors.primaryColor
                                            : Colors.grey[200],
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(
                                                isUser ? 20 : 0),
                                            bottomRight: Radius.circular(
                                                (isUser ? 0 : 20))),
                                      ),
                                      child: Label(
                                        txt: message["text"],
                                        forceColor: isUser
                                            ? Colors.white
                                            : Colors.black,
                                        type: TextTypes.f_16_500,
                                      ),
                                    ),
                                  )
                                ],
                              ));
                        },
                      ))),
                if (chatvis == true)
                  const SizedBox(
                    height: 20,
                  ),
                if (chatvis == true)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      // height: 84,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.grey),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Type a message...",
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: AppConst.fontFamily),
                              textInputAction: TextInputAction.done,
                              maxLines: null,
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 45,
                            child: Image.asset(
                              AppAssets.send,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 30),
                if (chatvis == true)
                  const Label(
                    txt: "Response will be shown within 3 business days",
                    forceColor: AppColors.red,
                    type: TextTypes.f_14_500,
                  ),

                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: (Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: commonButton(
                            txt: "Apply",
                            context: context,
                            onPressed: () => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PgDashBoard()),
                              )
                            },
                          )),
                      SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: commonButton(
                            txt: "Preview",
                            context: context,
                            onPressed: () => {},
                          )),
                    ],
                  )),
                ),

                const SizedBox(height: 60),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDetailsModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: Container(
          height: MediaQuery.of(context).size.height / 1.3,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Label(
                          txt: "Excercises",
                          type: TextTypes.f_18_500,
                          forceColor: AppColors.whiteColor,
                        ),
                        GestureDetector(
                          onTap: () => {Navigator.pop(context)},
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ]),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: index == 0 || index == 3 ? 12 : 7),
                                if (index == 0 || index == 3)
                                  Row(children: [
                                    SizedBox(
                                      height: 8,
                                      width: 8,
                                      child: Image.asset(
                                        AppAssets.dot,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Label(
                                        txt: index == 0
                                            ? "Day 1"
                                            : index == 3
                                                ? "Day 2"
                                                : "",
                                        type: TextTypes.f_16_700),
                                  ]),
                                SizedBox(
                                  height: index == 0 || index == 3 ? 12 : 7,
                                ),
                                GestureDetector(
                                    child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 84,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(15),
                                    border:
                                        Border.all(color: AppColors.lightGrey),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 66,
                                        width: 66,
                                        child: Image.asset(
                                          AppAssets.program,
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
                                            txt: "Smith machine shrug",
                                            type: TextTypes.f_15_500,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Label(
                                            txt: "Description",
                                            type: TextTypes.f_15_500,
                                            forceColor: AppColors.grey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ));
                      },
                    )),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ));
      },
    );
  }

  void _showCalendarModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            // height: MediaQuery.of(context).size.height / 1.8,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Label(
                        txt: "Choose date",
                        type: TextTypes.f_18_500,
                        forceColor: AppColors.whiteColor,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.close,
                          size: 20,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    color: AppColors.whiteColor,
                    padding: const EdgeInsets.all(18),
                    child: ValueListenableBuilder<DateTime>(
                      valueListenable: _selectedDay,
                      builder: (context, selectedDay, child) {
                        return TableCalendar(
                          firstDay: DateTime.utc(2020, 1, 1),
                          lastDay: DateTime.utc(2030, 12, 31),
                          focusedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          selectedDayPredicate: (day) =>
                              isSameDay(day, selectedDay),
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDay.value = selectedDay;
                              _focusedDay = focusedDay;
                            });
                          },
                          onFormatChanged: (format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          },
                          calendarStyle: const CalendarStyle(
                            outsideDaysVisible: false,
                            selectedTextStyle: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                            ),
                            todayTextStyle: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.whiteColor,
                            ),
                            defaultTextStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                              decoration: TextDecoration.none,
                            ),
                            weekendTextStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                              decoration: TextDecoration.none,
                            ),
                            todayDecoration: BoxDecoration(
                              color: AppColors.green,
                              shape: BoxShape.circle,
                            ),
                            selectedDecoration: BoxDecoration(
                              color: Color.fromARGB(255, 171, 168, 168),
                              shape: BoxShape.circle,
                            ),
                            markerDecoration: BoxDecoration(
                              color: AppColors.blackColor,
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
                              color: AppColors.blackColor,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          daysOfWeekStyle: const DaysOfWeekStyle(
                            weekdayStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                              decoration: TextDecoration.none,
                            ),
                            weekendStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: ElevatedButton(
                          onPressed: () => {Navigator.pop(context)},
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Label(
                            txt: "Apply",
                            type: TextTypes.f_18_600,
                            forceColor: AppColors.whiteColor,
                          ),
                        ))),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
