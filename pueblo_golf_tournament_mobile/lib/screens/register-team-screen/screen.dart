import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/screens/register-team-screen/controller.dart';

import '../../widgets/brand-elevated-button.dart';
import '../../widgets/brand-secondary-button.dart';

class RegisterTeamScreen extends StatelessWidget {
  final controller = Get.find<RegisterTeamScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Register Now"),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => controller.resetForm(),
        ),
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
                            image: AssetImage(
                                "assets/register-team-screen-image.png"))),
                Text(
                  controller.formTitles[controller.selectedFormIndex.value],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                controller.forms[controller.selectedFormIndex.value],
                Padding(padding: EdgeInsets.all(20)),
                controller.selectedFormIndex == controller.forms.length - 1
                    ? BrandElevatedButton(
                        onPressed: () => controller.goBackToHome(),
                        title: "Go back",
                        loading: false)
                    : Row(
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
                                onPressed: controller.disabledNext.value
                                    ? null
                                    : controller.selectedFormIndex ==
                                            controller.forms.length - 2
                                        ? () => controller.registerTeam()
                                        : () => controller.next(),
                                title: controller.selectedFormIndex ==
                                        controller.forms.length - 2
                                    ? "Register"
                                    : "Next",
                                loading: controller.isLoading.value),
                          )
                        ],
                      )
              ],
            )),
      ),
    );
  }
}
