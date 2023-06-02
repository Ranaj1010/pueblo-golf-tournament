import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/screens/pay-registration-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/pay-registration-screen/widgets.dart';

import '../../widgets/brand-elevated-button.dart';

class PayRegistrationScreen extends StatelessWidget {
  final controller = Get.find<PayRegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay Registration"),
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(20),
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
                              AssetImage("assets/payment-method-image.png"))),
              Text(
                controller.formTitles[controller.selectedFormIndex.value],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              controller.forms[controller.selectedFormIndex.value],
              Padding(padding: EdgeInsets.all(20)),
              controller.selectedFormIndex == controller.forms.length - 1
                  ? BrandElevatedButton(
                      onPressed: () => controller.goBack(),
                      title: "Go back",
                      loading: false)
                  : BrandElevatedButton(
                      onPressed: () => controller.makePayment(),
                      title: "Pay",
                      loading: controller.isLoading.value)
            ],
          ),
        ),
      ),
    );
  }
}
