import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/api/service/authentication-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/pages/dashboard-page-controller.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final controller = Get.find<DashboardPageController>();
  final authenticaedController = Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: Text(
                          "${authenticaedController.authenticatedUserData.value!.personalDetails!.firstName.substring(0, 1)}${authenticaedController.authenticatedUserData.value!.personalDetails!.lastName.substring(0, 1)}"),
                      maxRadius: 30,
                    ),
                    Wrap(
                      spacing: 0,
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        Text(
                          "Welcome back",
                        ),
                        Text(
                          authenticaedController.authenticatedUserData.value!
                              .personalDetails!.firstName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              child: Card(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Wrap(
                      spacing: 15,
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.golf_course_outlined),
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          children: [
                            Text(
                              "${authenticaedController.authenticatedUserData.value!.playerDetails!.worldHandicapSystemId}",
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                            Text("Your handicap"),
                            Text(
                              "${authenticaedController.authenticatedUserData.value!.playerDetails!.handicap}",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                "Play Now",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
                primary: true,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemCount: controller.tournaments.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 150,
                      child: GestureDetector(
                        onTap: () => controller
                            .selectTournament(controller.tournaments[index]),
                        child: Card(
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${controller.tournaments[index].name}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Wrap(
                                    spacing: 10,
                                    direction: Axis.horizontal,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 18,
                                      ),
                                      Text(
                                          '${controller.tournaments[index].venuePlace}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ));
                })
          ]),
        ),
      ),
    );
  }
}
