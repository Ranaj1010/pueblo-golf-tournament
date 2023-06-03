import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/pay-registration-screen/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/pay-registration-screen/widgets.dart';
import 'package:pueblo_golf_tournament_mobile/screens/registered-team-details-screen/controller.dart';

import '../../dto/request/register-payment-request-dto.dart';
import '../../utilities/enums.dart';

class PayRegistrationController extends IPayRegistrationScreenController {
  var proofOfPayment = Rxn<File>();
  var proofOfPaymentWeb = Rxn<Uint8List>();
  var paymentReferrenceIdTextController = TextEditingController();
  var selectedPaymentMethod = PaymentMethodEnum.GCash.obs;
  var selectedFormIndex = 0.obs;
  var isLoading = false.obs;
  var isPayed = false.obs;
  var forms = [];
  var formTitles = ["Pay Team's Registration", "Success!"];
  final registrationController = Get.find<RegistrationController>();
  final registeredTeamDetailsController =
      Get.find<RegisteredTeamDetailsScreenController>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    forms = [
      Obx(
        () => PaymentMethodForm(
          isWeb: kIsWeb,
          proofOfPaymentImageWeb: proofOfPaymentWeb.value,
          proofOfPaymentImage: proofOfPayment.value,
          paymentMethod: selectedPaymentMethod.value!,
          selectPaymentMethod: (paymentMethod) =>
              selectedPaymentMethod(paymentMethod),
          uploadProofOfPayment: () => uploadProofOfPayment(),
          paymentReferrenceIdTextController: paymentReferrenceIdTextController,
        ),
      ),
      PaymentSuccess()
    ];
  }

  @override
  void goBack() {
    selectedFormIndex(0);
    Get.back(result: isPayed.value);
  }

  @override
  void makePayment() async {
    isLoading(true);

    try {
      if (kIsWeb) {
        var paymentWeb = RegisterPaymentWebRequestDto(
            registrationId: registeredTeamDetailsController
                .registeredTeam.value!.registration.id,
            paymentMethod: selectedPaymentMethod.value.name,
            referrenceId: paymentReferrenceIdTextController.text,
            paymentDate: DateTime.now().toUtc(),
            paymentReferrencePhoto: proofOfPaymentWeb.value!);

        var registeredPayment =
            await registrationController.registerPaymentWeb(paymentWeb);
        if (registeredPayment.data != null) {
          selectedFormIndex(++selectedFormIndex.value);
          Get.snackbar("Payment Success", registeredPayment.message);
        }
      } else {
        var payment = RegisterPaymentRequestDto(
            registrationId: registeredTeamDetailsController
                .registeredTeam.value!.registration.id,
            paymentMethod: selectedPaymentMethod.value.name,
            referrenceId: paymentReferrenceIdTextController.text,
            paymentDate: DateTime.now().toUtc(),
            paymentReferrencePhoto: proofOfPayment.value!);

        var registeredPayment =
            await registrationController.registerPayment(payment);

        if (registeredPayment.data != null) {
          selectedFormIndex(++selectedFormIndex.value);
          Get.snackbar("Payment Success", registeredPayment.message);
        }
      }
    } catch (e) {
      print(e);
      Get.snackbar(
          "Payment Failed", "Something went wrong. Please try again later.");
    }

    isLoading(false);
  }

  @override
  void uploadProofOfPayment() async {
    try {
      if (kIsWeb) {
        var picker = ImagePicker();
        var picked = await picker.pickImage(
            source: ImageSource.gallery, requestFullMetadata: true);

        if (picked != null) {
          var image = await picked.readAsBytes();
          proofOfPaymentWeb(image);
          update();
        } else {
          print("No file selected");
        }
      } else {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) {
          return;
        }

        final imageTemp = File(image.path);
        proofOfPayment(imageTemp);
        update();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void selectPaymentMethod(PaymentMethodEnum paymentMethod) {
    selectedPaymentMethod(paymentMethod);
  }
}
