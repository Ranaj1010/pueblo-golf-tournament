import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/app.dart';
import 'package:pueblo_golf_tournament_mobile/screens/landing-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-elevated-button.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-secondary-button.dart';

class LandingScreen extends StatelessWidget {
  final controller = Get.find<LandingScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        Container(
          alignment: Alignment.bottomCenter,
          child: const SizedBox(
              width: double.infinity,
              height: 500,
              child: Blur(
                blur: 1,
                blurColor: Colors.white,
                child: Image(
                  image: AssetImage("assets/background-landing.png"),
                  fit: BoxFit.cover,
                ),
              )),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 100, 30, 80),
                child: Wrap(
                    verticalDirection: VerticalDirection.down,
                    alignment: WrapAlignment.center,
                    runSpacing: 20,
                    children: [
                      const Text(
                        "Pueblo Golf",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      BrandElevatedButton(
                          loading: false,
                          onPressed: () => controller.goToSignIn(),
                          title: "Sign In"),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Divider(), Text("Or"), Divider()],
                      ),
                      BrandSecondaryButton(
                          loading: false,
                          onPressed: () => controller.goToSignUp(),
                          title: "Create your account"),
                    ]),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.fromLTRB(0, 65, 0, 0),
          child: SizedBox(
              width: double.infinity,
              height: 120,
              child: const CircleAvatar(
                  child: Image(image: AssetImage("assets/golf-logo.png")))),
        ),
      ]),
    );
  }
}
