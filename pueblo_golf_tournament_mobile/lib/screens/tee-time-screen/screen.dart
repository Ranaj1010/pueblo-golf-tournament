import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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

  @override
  void initState() {
    super.initState();
    controller.initializeTeeTime(
        viewTeamMemberScreenController.selectedTournamentScheduleDate.value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tee Time"),
      ),
      body: const SingleChildScrollView(
        child: Wrap(
          children: [],
        ),
      ),
    );
  }
}
