import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/pages/dashboard-page/widgets.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/widgets.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-elevated-button.dart';

class TournamentDetailScreen extends StatelessWidget {
  final controller = Get.find<TournamentDetailsScreenController>();
  final dataContextController = Get.find<DataContextController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tournament"),
        actions: [
          IconButton(
              onPressed: () => controller.loadTeamRegistration(),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            controller.loadTeamRegistration();
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: controller.loadingRegistrations.value
                ? const CircularProgressIndicator()
                : Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      TournamentCard(
                          tournament: controller.selectedTournament.value!,
                          onSelectTournament: (tournament) => {}),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 10,
                        child: ListView(
                            padding: const EdgeInsets.all(0),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                title: Text(
                                  "${DateFormat("MMMM dd, yyyy").format(controller.selectedTournament.value!.startDate.toUtc())} - ${DateFormat("MMMM dd, yyyy").format(controller.selectedTournament.value!.endDate.toUtc())}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: const Text("Event Date"),
                                leading: const Icon(Icons.date_range),
                              ),
                              const Divider(),
                              ListTile(
                                title: Text(
                                  controller.formatter.format(controller
                                      .selectedTournament.value!.registrationFee
                                      .toString()),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: const Text("Registration fee"),
                                leading: const Icon(Icons.money),
                              ),
                              ListTile(
                                title: Text(
                                  controller
                                      .selectedTournament.value!.numberOfSlots
                                      .toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: const Text("Available Slots"),
                                leading: const Icon(Icons.golf_course),
                              ),
                            ]),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      controller.registeredTeams.isEmpty
                          ? BrandElevatedButton(
                              onPressed: () => controller.registerTeam(),
                              title: "Register Now",
                              loading: false)
                          : Wrap(
                              runSpacing: 10,
                              children: [
                                Text(
                                  dataContextController.authenticatedData.value!
                                              .account!.accountType ==
                                          1
                                      ? "Teams"
                                      : "My Team",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                RegisteredTeamList(
                                    onSelectTeam: (team) =>
                                        controller.selectRegisteredTeam(team),
                                    isLoading:
                                        controller.loadingRegistrations.value,
                                    registeredTeams:
                                        controller.registeredTeams),
                              ],
                            ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
