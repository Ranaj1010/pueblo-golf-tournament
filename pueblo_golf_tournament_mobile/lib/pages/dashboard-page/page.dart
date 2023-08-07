import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/pages/dashboard-page/controller.dart';
import 'package:pueblo_golf_tournament_mobile/pages/dashboard-page/widgets.dart';
import 'package:pueblo_golf_tournament_mobile/screens/home-screen/controller.dart';

class DashboardPage extends StatelessWidget {
  final controller = Get.find<DashboardPageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: () async {
          controller.loadTournaments();
        },
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: DashboardPlayerProfile(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: "Search tournaments..",
                    suffixIcon: Icon(Icons.search)),
                readOnly: true,
                controller: controller.searchTextController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Tournaments",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                      onPressed: () => controller.viewMoreTournaments(),
                      child: const Text(
                        "View More",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: DashboardTournamentList(
                  loadingData: controller.isLoadingTournaments.value,
                  tournaments: controller.tournaments,
                  selectTournament: (tournament) =>
                      controller.selectTournament(tournament)),
            )
          ]),
        ),
      ),
    );
  }
}
