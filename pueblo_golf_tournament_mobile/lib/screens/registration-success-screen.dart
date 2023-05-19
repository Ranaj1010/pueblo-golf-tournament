import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/screens/registration-success-screen-controller.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  final controller = Get.find<RegistrationSuccessScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Text("Registration Success"),
        ElevatedButton(
            onPressed: () => controller.goBackToLanding(),
            child: Text("Go back"))
      ]),
    );
  }
}
