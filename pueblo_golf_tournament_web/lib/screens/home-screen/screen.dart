import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_web/screens/home-screen/controller.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: controller.pages[controller.selectedPage.value],
        drawerEnableOpenDragGesture: false,
        drawer: Drawer(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                    title: Text(controller.menuPages[index]),
                    onTap: () {
                      controller.selectPage(index);
                      Navigator.pop(context);
                    }),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: controller.pages.length)
          ],
        )),
      ),
    );
  }
}
