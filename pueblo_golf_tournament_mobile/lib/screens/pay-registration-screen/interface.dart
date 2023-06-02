import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';

abstract class IPayRegistrationScreenController extends GetxController {
  void uploadProofOfPayment();
  void makePayment();
  void goBack();
  void selectPaymentMethod(PaymentMethodEnum paymentMethod);
}
