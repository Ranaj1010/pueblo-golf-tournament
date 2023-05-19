import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/screens/register-team-success-screen-controller.dart';

class RegistrationTeamSuccessScreen extends StatelessWidget {
  final controller = Get.find<RegistrationTeamSuccessScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Text("Registration Success"),
        ElevatedButton(
            onPressed: () => controller.goBackToTournamentDetails(),
            child: Text("Go back"))
      ]),
    );
  }
}
