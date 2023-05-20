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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Image(
                image: AssetImage("assets/success-image.png"),
                height: 200,
              ),
            ),
            const Text(
              "Congratulations!",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "You are all set!",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(16.0)),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    onPressed: () => controller.goBackToLanding(),
                    child: const Text("Go back"))),
          ]),
        ),
      ),
    );
  }
}
