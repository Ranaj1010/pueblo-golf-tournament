import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/payment-channel-account-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-payment-channel-accounts-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/select-payment-method-screen/interface.dart';

import '../pay-registration-screen/controller.dart';

class SelectPaymentMethodController extends ISelectPaymentMethodController {
  var isLoading = false.obs;
  var paymentChannelAccounts = <PaymentChannelAccountDto>[].obs;
  var selectedPaymentChannelAccount = Rxn<PaymentChannelAccountDto>();
  final lookupController = Get.find<LookupController>();

  @override
  void doneSelect() {
    Get.back(result: true);
  }

  @override
  void loadPaymentAccountOptions(int tournamentId) async {
    isLoading(true);
    paymentChannelAccounts.clear();
    try {
      var response = await lookupController.lookupPaymentChannelAccounts(
          LookupPaymentChannelAccountsRequestDto(tournamentId: tournamentId));

      if (response.data != null) {
        print(tournamentId);
        print(jsonEncode(response.data));
        paymentChannelAccounts.addAll(response.data!);
      }
    } catch (e) {
      Get.snackbar("Failed", "Failed to fetch payment methods.");
    }
    isLoading(false);
  }

  @override
  void selectPaymentAccount(PaymentChannelAccountDto? paymentChannelAccount) {
    selectedPaymentChannelAccount(paymentChannelAccount);
  }
}
