import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/api/service/authentication-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/home-screen-controller.dart';
import 'package:pueblo_golf_tournament_mobile/pages/dashboard-page.dart';
import 'package:pueblo_golf_tournament_mobile/pages/leaderboard-page.dart';
import 'package:pueblo_golf_tournament_mobile/pages/menu-page.dart';
import 'package:pueblo_golf_tournament_mobile/pages/schedules-page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final authenticationController = Get.find<AuthenticationController>();
  final controller = Get.find<HomeScreenController>();
  List<Widget> pages = [
    DashboardPage(),
    LeaderBoardPage(),
    SchedulesPage(),
    MenuPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(actions: [
            IconButton(
                onPressed: () => controller.signOut(), icon: Icon(Icons.logout))
          ]),
          body: pages[controller.selectedPage.value],
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: const Color.fromARGB(255, 89, 141, 108),
            selectedItemColor: const Color.fromARGB(255, 24, 193, 123),
            onTap: (index) => controller.selectPage(index),
            currentIndex: controller.selectedPage.value,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_score),
                label: 'Score Board',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.schedule_outlined),
                label: 'Schedules',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Menu',
              ),
            ],
          )),
    );
  }
}
