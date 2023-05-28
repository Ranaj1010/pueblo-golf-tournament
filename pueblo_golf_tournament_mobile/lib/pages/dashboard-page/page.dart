import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/pages/dashboard-page/controller.dart';
import 'package:pueblo_golf_tournament_mobile/pages/dashboard-page/widgets.dart';

class DashboardPage extends StatelessWidget {
  final controller = Get.find<DashboardPageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(children: [
          DashboardPlayerProfile(),
          TextField(
            decoration: const InputDecoration(
                hintText: "Search tournaments..",
                suffixIcon: Icon(Icons.search)),
            readOnly: true,
            controller: controller.searchTextController,
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
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
          const Padding(padding: EdgeInsets.all(10)),
          DashboardTournamentList(
              loadingData: controller.isLoadingTournaments.value,
              tournaments: controller.tournaments,
              selectTournament: (tournament) =>
                  controller.selectTournament(tournament))
        ]),
      ),
    );
  }
}
