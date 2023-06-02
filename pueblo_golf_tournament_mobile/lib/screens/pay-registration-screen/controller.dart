import 'dart:io';

import 'package:file_picker/file_picker.dart';
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
    } catch (e) {
      Get.snackbar(
          "Payment Success", "Something went wrong. Please try again later.");
    }

    isLoading(false);
  }

  @override
  void uploadProofOfPayment() async {
    if (kIsWeb) {
      var picked = await FilePicker.platform.pickFiles();

      if (picked != null) {
        final imageTemp = File(picked.files.first.path!);
        proofOfPayment(imageTemp);
        update();
      }
    } else {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }

      final imageTemp = File(image.path);
      proofOfPayment(imageTemp);
      update();
    }
  }

  @override
  void selectPaymentMethod(PaymentMethodEnum paymentMethod) {
    selectedPaymentMethod(paymentMethod);
  }
}
