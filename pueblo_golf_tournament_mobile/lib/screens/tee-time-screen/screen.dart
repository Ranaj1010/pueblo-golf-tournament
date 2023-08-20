import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tee-time-screen/controller.dart';

import '../../dto/response/lookup-tee-time-schedules-response-dto.dart';
import '../view-team-member-screen/controller.dart';

class TeeTimeScreen extends StatefulWidget {
  const TeeTimeScreen({super.key});

  @override
  State<StatefulWidget> createState() => TeeTimeScreenState();
}

class TeeTimeScreenState extends State<TeeTimeScreen> {
  final controller = Get.find<TeeTimeScreenController>();
  final viewTeamMemberScreenController =
      Get.find<ViewTeamMemberScreenController>();

  final dataContextController = Get.find<DataContextController>();

  @override
  void initState() {
    super.initState();
    controller.initializeTeeTime(
        viewTeamMemberScreenController.selectedTournamentScheduleDate.value!);
  }

  String getMolaveScore(int value) {
    switch (value) {
      case 6:
        return "Albatross";
      case 5:
        return "Eagle";
      case 4:
        return "Birdie";
      case 3:
        return "Par";
      case 2:
        return "Bogey";
      case 1:
        return "Double Bogey";
      case 0:
        return "Triple Bogey";
      default:
        return "X";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tee Time & Scores"),
        centerTitle: false,
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            runSpacing: 20,
            children: [
              Wrap(
                children: [
                  const Text(
                    "Tee Time",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.date_range),
                      ),
                      trailing:
                          controller.tournamentScheduleDate.value!.holeType == 0
                              ? Text(
                                  "Front 9",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14),
                                )
                              : Text(
                                  "Back 9",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14),
                                ),
                      title: Text(
                        DateFormat("E, MMMM dd, yyyy").format(controller
                            .tournamentScheduleDate
                            .value!
                            .timeSchedules![0]
                            .dateTimeSlot),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(DateFormat("hh:mm a").format(controller
                          .tournamentScheduleDate
                          .value!
                          .timeSchedules![0]
                          .dateTimeSlot)),
                    ),
                  ),
                ],
              ),
              Wrap(
                children: [
                  const Text(
                    "Scores",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  controller.isLoadingScores.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.tournamentPlayerScores.isNotEmpty
                          ? Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: ListView.separated(
                                  padding: const EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => ListTile(
                                        leading: const CircleAvatar(
                                            child: Icon(Icons.golf_course)),
                                        title: Text(
                                          "#${controller.tournamentHoles.firstWhere((element) => element.id == controller.tournamentPlayerScores[index].tournamentHoleId).holeNumber}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        subtitle: Text(
                                            "PAR: ${controller.tournamentHoles.firstWhere((element) => element.id == controller.tournamentPlayerScores[index].tournamentHoleId).maximumStrokes}"),
                                        trailing: Text(
                                          "${controller.tournamentPlayerScores[index].actualStrokes} strokes",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                  itemCount:
                                      controller.tournamentPlayerScores.length),
                            )
                          : const Center(
                              child: Text("No scores yet."),
                            )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          dataContextController.authenticatedData.value!.account!.accountType ==
                  3
              ? FloatingActionButton.extended(
                  onPressed: () => controller.addScore(),
                  label: const Text("New Score"),
                  icon: const Icon(Icons.add),
                )
              : null,
    );
  }
}
