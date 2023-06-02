import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pueblo_golf_tournament_mobile/screens/update-member-details-screen/controller.dart';

import '../../widgets/brand-elevated-button.dart';
import '../../widgets/brand-secondary-button.dart';

class UpdateMemberDetailsScreen extends StatelessWidget {
  final controller = Get.find<UpdateMemberDetailsScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
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
                        onPressed: () => controller.goBack(),
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
                                onPressed: controller.selectedFormIndex ==
                                        controller.forms.length - 2
                                    ? () => controller.updatePlayerProfile()
                                    : () => controller.next(),
                                title: controller.selectedFormIndex ==
                                        controller.forms.length - 2
                                    ? "Update"
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
