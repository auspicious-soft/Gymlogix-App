import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gymlogix/Models/model_view.dart';

import 'package:gymlogix/Services/api_service.dart';

import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_config.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';
import 'package:gymlogix/features/base/presentation/screens/dashboard/tab_home/tab_home.dart';
import 'package:gymlogix/features/base/presentation/screens/dashboard/tab_insight/tab_insight.dart';
import 'package:gymlogix/features/base/presentation/screens/dashboard/tab_plan/tab_plan.dart';
import 'package:gymlogix/features/base/presentation/screens/dashboard/tab_setting/tab_setting.dart';
import 'package:gymlogix/features/base/presentation/screens/dashboard/tab_stats/tab_stats.dart';

class PgDashBoard extends StatefulWidget {
  final int initialTabIndex;

  const PgDashBoard({super.key, this.initialTabIndex = 0});

  @override
  State<StatefulWidget> createState() {
    return _StatePgDashBoard();
  }
}

class _StatePgDashBoard extends State<PgDashBoard> {
  int selectedIndex;
  late Future<ModelView?> homeScreenData;

  _StatePgDashBoard() : selectedIndex = 0;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    homeScreenData = fetchHomeScreenData(context);
    selectedIndex = widget.initialTabIndex;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.jumpToPage(selectedIndex);
    });
  }

  List<Widget> get tabViews => [
        // Pass homeScreenData to TabHome
        FutureBuilder<ModelView?>(
          future: homeScreenData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return TabHome(homeScreenData: snapshot.data!); // Pass data here
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
        const TabPlan(),
        const TabStats(),
        FutureBuilder<ModelView?>(
          future: homeScreenData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return TabInsight(
                  insightScreenData: snapshot.data!); // Pass data here
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
        // const TabInsight(),
        const TabSetting()
      ];

  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: tabViews,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
              pageController.jumpToPage(index);
            });
          },
          unselectedFontSize: 10,
          selectedFontSize: 10,
          unselectedLabelStyle:
              const TextStyle(fontFamily: AppConst.fontFamily),
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            _buildNavItem("HOME", Icons.home, 0),
            _buildNavItem("PLAN", Icons.article, 1),
            _buildNavItem("STATS", Icons.bar_chart, 2),
            _buildNavItem("INSIGHT", Icons.lightbulb, 3),
            _buildNavItem("SETTINGS", Icons.settings, 4),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      String label, IconData icon, int index) {
    bool isActive = selectedIndex == index;
    return BottomNavigationBarItem(
      icon: SizedBox(
        height: 70,
        width: 70,
        child: Container(
          decoration: BoxDecoration(
            color: isActive ? Colors.grey.shade200 : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Icon(icon,
                  color: isActive ? AppColors.blackColor : AppColors.tablabel),
              Label(
                  txt: label,
                  type: TextTypes.f_10_500,
                  forceColor:
                      isActive ? AppColors.blackColor : AppColors.tablabel),
              if (isActive)
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 3,
                    width: 20,
                    color: AppColors.primaryColor),
            ],
          ),
        ),
      ),
      label: "",
    );
  }

  Future<ModelView?> fetchHomeScreenData(BuildContext context) async {
    try {
      final fullToken = await secureStorage.read(key: 'token');
      if (fullToken == null || !fullToken.startsWith("Bearer ")) {
        print('Error: Invalid token format.');
        return null;
      }

      final token = fullToken.replaceFirst("Bearer ", "");
      final response = await ApiService.request(
        AppConfig.allGet,
        method: 'GET',
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response['status'] == 0) {
        final homeScreenData = ModelView.fromJson(response);
        return homeScreenData;
      } else {
        Flushbar(
          message: "Something went wrong!",
          duration: const Duration(seconds: 2),
          flushbarStyle: FlushbarStyle.GROUNDED,
        ).show(context);
      }
    } catch (e) {
      Flushbar(
        message: "Error: $e",
        duration: const Duration(seconds: 2),
        flushbarStyle: FlushbarStyle.GROUNDED,
      ).show(context);
      print('Error home: $e');
    }
    return null;
  }
}
