import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/screens/register-new-player-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/sign-up-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-elevated-button.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-secondary-button.dart';

class RegisterNewPlayerScreen extends StatelessWidget {
  final controller = Get.find<RegisterNewPlayerScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register New"),
      ),
      body: Obx(
        () => SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Wrap(
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                controller.selectedFormIndex == controller.forms.length - 1
                    ? const Center(
                        child: Image(
                          image: AssetImage("assets/success-image.png"),
                          height: 280,
                        ),
                      )
                    : const Center(
                        child: Image(
                            image:
                                AssetImage("assets/sign-up-screen-image.png"))),
                Text(
                  controller.formTitles[controller.selectedFormIndex.value],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                controller.isMemberAlreadyExists.value
                    ? Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 254, 232, 232)),
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "Member already exists. Please add another member for this team.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w600),
                        ),
                      )
                    : const Padding(padding: EdgeInsets.all(0)),
                controller.forms[controller.selectedFormIndex.value],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: BrandSecondaryButton(
                          onPressed: controller.selectedFormIndex > 0
                              ? () => controller.previous()
                              : null,
                          title: "Back",
                          loading: false),
                    ),
                    SizedBox(
                      width: 150,
                      child: BrandElevatedButton(
                          onPressed: controller.selectedFormIndex ==
                                  controller.forms.length - 2
                              ? () => controller.registerPlayerProfile()
                              : () => controller.next(),
                          title: controller.selectedFormIndex ==
                                  controller.forms.length - 2
                              ? "Create"
                              : "Next",
                          loading: false),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
