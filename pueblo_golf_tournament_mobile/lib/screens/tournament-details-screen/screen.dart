import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';
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
                                  MoneyFormatter(
                                          settings: MoneyFormatterSettings(
                                              symbol: '₱'),
                                          amount: controller.selectedTournament
                                              .value!.registrationFee)
                                      .output
                                      .symbolOnLeft,
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
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 237, 217, 186)),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.vertical,
                          spacing: 10,
                          children: [
                            const Text(
                                "For inquiries regarding your registration \nplease contact:"),
                            Column(
                              children: [
                                Text(
                                  controller.selectedTournament.value!
                                      .nameOfTournamentSupport,
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  controller.selectedTournament.value!
                                      .contactNumberOfTournamentSupport,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
