import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/screens/add-tournament-schedule-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/add-tournament-scorer-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/sign-up-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-elevated-button.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-secondary-button.dart';

class AddTournamentScorerScreen extends StatefulWidget {
  @override
  State<AddTournamentScorerScreen> createState() =>
      _AddTournamentScorerScreenState();
}

class _AddTournamentScorerScreenState extends State<AddTournamentScorerScreen> {
  final controller = Get.find<AddTournamentScorerScreenController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Scorer account"),
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
                controller.forms[controller.selectedFormIndex.value],
                controller.selectedFormIndex == controller.forms.length - 1
                    ? BrandElevatedButton(
                        onPressed: () => controller.back(),
                        title: "Go Back",
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
                                onPressed: controller.selectedFormIndex ==
                                        controller.forms.length - 2
                                    ? () => controller.registerScorer()
                                    : () => controller.next(),
                                title: controller.selectedFormIndex ==
                                        controller.forms.length - 2
                                    ? "Create"
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
