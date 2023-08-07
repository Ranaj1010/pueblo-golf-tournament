import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/api/authentication/authentication-controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/home-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/home-screen/widgets.dart';

import '../../data/context.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.find<HomeScreenController>();
  final dataContextController = Get.find<DataContextController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            leadingWidth: 90,
            leading: HomeAppBarLeading(
                name: dataContextController.authenticatedData.value!
                        .personalDetails!.firstName[0] +
                    dataContextController
                        .authenticatedData.value!.personalDetails!.lastName[0]),
            title:
                Text(controller.pagesTitle[controller.selectedPageIndex.value]),
            actions: [
              IconButton(
                  onPressed: () => controller.viewNotifications(),
                  icon: const Icon(Icons.notifications))
            ],
          ),
          body: controller.pages[controller.selectedPageIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: (index) => controller.selectPage(index),
            currentIndex: controller.selectedPageIndex.value,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_score),
                label: 'My Teams',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.schedule_outlined),
                label: 'History',
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
