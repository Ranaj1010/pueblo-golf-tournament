import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/tournament-details-screen-controller.dart';

class TournamentDetailScreen extends StatelessWidget {
  TournamentDetailScreen({super.key});
  final controller = Get.find<TournamentDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              Blur(
                blur: 0.2,
                blurColor: Colors.black,
                child: Image(
                  image: AssetImage('assets/tournament-background.png'),
                  height: 240.0,
                  width: double.infinity,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor: Color.fromRGBO(24, 233, 111, 0),
                        foregroundColor: Colors.white,
                      ),
                      Container(
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                controller.selectedTournament.value!.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Card(
                                  elevation: 10,
                                  child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Wrap(
                                        spacing: 20,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.vertical,
                                        children: [
                                          Wrap(
                                            alignment: WrapAlignment.center,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            direction: Axis.horizontal,
                                            spacing: 10,
                                            children: [
                                              Icon(Icons.location_on),
                                              Text(
                                                  "${controller.selectedTournament.value!.venuePlace}"),
                                            ],
                                          ),
                                          Wrap(
                                            alignment: WrapAlignment.center,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            direction: Axis.horizontal,
                                            spacing: 10,
                                            children: [
                                              Icon(Icons.date_range),
                                              Text(
                                                  "${DateFormat("MMMM dd, yyyy").format(controller.selectedTournament.value!.startDate)} - ${DateFormat("MMMM dd, yyyy").format(controller.selectedTournament.value!.endDate)}"),
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              controller.registeredRegistration.value != null
                                  ? Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 20, 5, 10),
                                      child: Text(
                                        "Your Team",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                  : Padding(padding: EdgeInsets.all(0)),
                              controller.registeredRegistration.value != null
                                  ? SizedBox(
                                      width: double.infinity,
                                      child: Card(
                                        elevation: 10,
                                        child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: ListTile(
                                              leading: Icon(Icons.group),
                                              title: Text(
                                                controller.registeredTeam.value!
                                                    .name!,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Text(
                                                controller.registeredDivision
                                                    .value!.name,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              trailing: Text(
                                                controller.registeredRegistration
                                                            .value!.status ==
                                                        0
                                                    ? "Pending"
                                                    : "Confirmed",
                                                style: TextStyle(
                                                    color: controller
                                                                .registeredRegistration
                                                                .value!
                                                                .status ==
                                                            0
                                                        ? Color.fromARGB(
                                                            255, 228, 138, 19)
                                                        : Colors.green),
                                              ),
                                            )),
                                      ),
                                    )
                                  : Padding(padding: EdgeInsets.all(0)),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
                                  child: Text(
                                    "Divisions",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                              controller.divisions.length == 0
                                  ? Center(
                                      child: Text("No divisions found."),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Card(
                                            surfaceTintColor: Colors.white,
                                            elevation: 10,
                                            child: Column(
                                              children: [
                                                ListView.separated(
                                                  primary: true,
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  itemCount: controller
                                                      .divisions.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return InkWell(
                                                      onTap: () => {
                                                        showModalBottomSheet<
                                                                void>(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return Container(
                                                                height: 150,
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        20,
                                                                        10,
                                                                        20,
                                                                        10),
                                                                child: Center(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        controller
                                                                            .divisions[index]
                                                                            .name,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      Padding(
                                                                          padding:
                                                                              EdgeInsets.all(10)),
                                                                      SizedBox(
                                                                          width:
                                                                              double.infinity,
                                                                          child: TextButton(
                                                                              child: const Text('Join Tournament'),
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                                controller.selectedDivision(controller.divisions[index]);
                                                                                controller.goToRegisterTeam();
                                                                              }))
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            })
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20.0),
                                                          child: Text(
                                                            controller
                                                                .divisions[
                                                                    index]
                                                                .name,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return const Divider();
                                                  },
                                                )
                                              ],
                                            )),
                                      ),
                                    )
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
