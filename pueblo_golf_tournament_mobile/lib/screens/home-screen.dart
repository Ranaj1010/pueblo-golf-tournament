import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/pages/menu-page.dart';
import 'package:pueblo_golf_tournament_mobile/pages/score-board-page.dart';
import 'package:pueblo_golf_tournament_mobile/pages/tee-time-page.dart';

import '../controllers/account-controller.dart';
import '../pages/dashboard-page.dart';
import '../widgets/common-widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final accountController = Get.find<AccountController>();

  int selectedIndex = 0;
  static List<Widget> widgetOptions = <Widget>[
    const DashboardPage(),
    ScoreboardPage(),
    TeeTimePage(),
    MenuPage()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  String getTitle() {
    switch (selectedIndex) {
      case 0:
        return "Hello, ${accountController.diplayName.value}!";
      case 1:
        return "Score Board";
      case 2:
        return "Tee time";
      case 3:
        return "Menu";
      default:
        return "";
    }
  }

  PreferredSizeWidget getAppBar() {
    switch (selectedIndex) {
      case 0:
        return AppBar(
            title: const Text(""),
            backgroundColor: Colors.white,
            centerTitle: false,
            actions: [
              IconButton(onPressed: () => {}, icon: Icon(Icons.notifications)),
              IconButton(
                  onPressed: () => {}, icon: Icon(Icons.history_outlined)),
            ]);
      case 1:
        return AppBar(
            title: const Text(""),
            centerTitle: false,
            backgroundColor: Colors.white,
            actions: [
              IconButton(onPressed: () => {}, icon: Icon(Icons.refresh)),
            ]);
      case 2:
        return AppBar(
            title: const Text(""),
            centerTitle: false,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () => {}, icon: Icon(Icons.add_circle_outline)),
            ]);
      case 3:
        return AppBar(
            title: const Text(""),
            centerTitle: false,
            backgroundColor: Colors.white,
            actions: [
              IconButton(onPressed: () => {}, icon: Icon(Icons.notifications)),
              IconButton(
                  onPressed: () => accountController.logout(),
                  icon: const Icon(Icons.logout))
            ]);
      default:
        return AppBar(
            title: const Text(""),
            centerTitle: false,
            backgroundColor: Colors.white,
            actions: [
              IconButton(onPressed: () => {}, icon: Icon(Icons.notifications)),
              IconButton(
                  onPressed: () => accountController.logout(),
                  icon: Icon(Icons.logout))
            ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Text(
                getTitle(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
            ),
            widgetOptions[selectedIndex]
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.golf_course),
            label: 'Tee Time',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Menu',
          ),
        ],
        currentIndex: selectedIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color.fromARGB(255, 89, 141, 108),
        selectedItemColor: const Color.fromARGB(255, 24, 193, 123),
        onTap: onItemTapped,
      ),
    );
  }
}
