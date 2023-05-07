import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pueblo_golf_tournament_mobile/models/tournament.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/tournament-banner.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  void onHandleOnClickTournament(Tournament tournament) {
    print("Pressed...");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Tournaments",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TournamentBanner(
        name: "Pueblo Golf Championship Tournament",
        onTap: (tournament) => onHandleOnClickTournament(tournament),
        tournament: null,
      )
    ]));
  }
}
