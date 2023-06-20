import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/payment-channel-account-dto.dart';

abstract class ISelectPaymentMethodController extends GetxController {
  void loadPaymentAccountOptions(int tournamentId);
  void doneSelect();
  void selectPaymentAccount(PaymentChannelAccountDto paymentChannelAccount);
}
