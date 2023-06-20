import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/screens/pay-registration-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/select-payment-method-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/select-payment-method-screen/interface.dart';

import '../../dto/model/payment-channel-account-dto.dart';

class SelectPaymentMethodScreen extends StatelessWidget {
  final controller = Get.find<SelectPaymentMethodController>();
  final paycontroller = Get.find<PayRegistrationController>();

  List<Widget> createRadioListUsers() {
    List<Widget> widgets = [];

    if (controller.paymentChannelAccounts.isEmpty) {
      widgets.add(const Center(
        child: Text("No payment methods found."),
      ));

      return widgets;
    }

    for (PaymentChannelAccountDto account
        in controller.paymentChannelAccounts) {
      widgets.add(
        RadioListTile(
          value: account,
          groupValue: paycontroller.selectedPaymentChannelAccount.value,
          title: Text(account.accountName),
          subtitle: Text(
              "${account.paymentChannel!.name} - ${account.accountNumber}"),
          onChanged: (value) => paycontroller
              .selectedPaymentChannelAccount(value as PaymentChannelAccountDto),
          selected: controller.selectedPaymentChannelAccount == account,
        ),
      );
    }
    return widgets;
  }

  SelectPaymentMethodScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Payment Method"),
          actions: [
            IconButton(
                onPressed: () => controller.doneSelect(),
                icon: const Icon(Icons.check))
          ],
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: createRadioListUsers(),
                ),
        ));
  }
}
