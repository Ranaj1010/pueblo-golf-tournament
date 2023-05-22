import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/landing-screen-controller.dart';

class LandingScreen extends StatelessWidget {
  final controller = Get.find<LandingScreenController>();

  LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      color: FlavorConfig.instance.color,
      location: FlavorConfig.instance.location,
      child: Scaffold(
          appBar: AppBar(actions: []),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Image(
                      image: AssetImage('assets/golf-logo.png'),
                      height: 100,
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    const Text(
                      "Pueblo Golf \nTournament",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                    ),
                    Padding(padding: EdgeInsets.all(40)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Column(
                        children: [
                          SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.all(16.0)),
                                      foregroundColor:
                                          const MaterialStatePropertyAll(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Theme.of(context).primaryColor)),
                                  onPressed: controller.handleLogin,
                                  child: const Text("Sign In"))),
                          Padding(padding: EdgeInsets.all(5)),
                          SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.all(16.0))),
                                onPressed: controller.handleRegister,
                                child: Text("Register"),
                              )),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ))),
    );
  }
}
