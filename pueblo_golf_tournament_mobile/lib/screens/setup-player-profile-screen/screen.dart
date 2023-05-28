import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/screens/register-new-player-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/setup-player-profile-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/sign-up-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-elevated-button.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-secondary-button.dart';

class SetupPlayerProfileScreen extends StatelessWidget {
  final controller = Get.find<SetupPlayerProfileScreenController>();

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
                            image: AssetImage(
                                "assets/add-member-screen-image.png"))),
                Text(
                  controller.formTitles[controller.selectedFormIndex.value],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                controller.forms[controller.selectedFormIndex.value],
                controller.selectedFormIndex == controller.forms.length - 1
                    ? BrandElevatedButton(
                        onPressed: () => controller.back(),
                        title: "Go Back",
                        loading: false)
                    : BrandElevatedButton(
                        onPressed: () => controller.saveProfile(),
                        title: "Save Profile",
                        loading: false)
              ],
            )),
      ),
    );
  }
}
