import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/landing-screen-controller.dart';

class LandingScreen extends StatelessWidget {
  final controller = Get.find<LandingScreenController>();

  LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            const Text(
              "Pueblo Golf \nTournament",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: controller.handleLogin,
                          child: const Text("Sign In"))),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: controller.handleRegister,
                          child: const Text("Register"))),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
