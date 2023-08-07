import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/controller.dart';

import 'controller.dart';

class TournamentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TournamentScreenState();
  }
}

class TournamentScreenState extends State<TournamentScreen> {
  var tournamentScreenController = Get.find<TournamentScreenController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tournamentScreenController.loadTournaments();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tournaments"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Center(child: Text("Tournaments")),
      ),
    );
  }
}
