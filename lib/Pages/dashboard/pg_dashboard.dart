import 'package:flutter/material.dart';
import 'package:gymlogix/Pages/dashboard/tab_home/tab_home.dart';
import 'package:gymlogix/Pages/dashboard/tab_insight/tab_insight.dart';
import 'package:gymlogix/Pages/dashboard/tab_plan/tab_plan.dart';
import 'package:gymlogix/Pages/dashboard/tab_setting/tab_setting.dart';
import 'package:gymlogix/Pages/dashboard/tab_stats/tab_stats.dart';
import 'package:gymlogix/app_settings/components/label.dart';
import 'package:gymlogix/app_settings/constants/app_colors.dart';
import 'package:gymlogix/app_settings/constants/app_const.dart';

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

  _StatePgDashBoard() : selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex =
        widget.initialTabIndex; // Set the initial selected tab index
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Ensure the PageController syncs after build
      pageController.jumpToPage(selectedIndex);
    });
  }

  List<Widget> get tabViews => [
        const TabHome(),
        const TabPlan(),
        const TabStats(),
        const TabInsight(),
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
              pageController
                  .jumpToPage(index); // This ensures the page view is updated
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
              const SizedBox(
                height: 15,
              ),
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
}
