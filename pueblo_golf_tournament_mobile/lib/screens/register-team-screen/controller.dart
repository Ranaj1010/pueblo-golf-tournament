import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/upload/upload-controller.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-payment-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-team-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/upload-mobile-proof-of-payment-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/upload-mobile-team-logo-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/register-team-screen/widgets.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';

import '../../dto/response/register-team-response-dto.dart';
import 'interface.dart';

class RegisterTeamScreenController extends IRegisterTeamScreenController {
  var selectedFormIndex = 0.obs;
  var isLoading = false.obs;
  var disabledNext = true.obs;
  var teamLogo = Rxn<File>();
  var proofOfPayment = Rxn<File>();
  var members = <PlayerProfile>[].obs;
  var selectedPaymentMethod = PaymentMethodEnum.GCash.obs;
  var paymentReferrenceIdTextController = TextEditingController();
  final dataContextController = Get.find<DataContextController>();
  final tournamentDetailsController =
      Get.find<TournamentDetailsScreenController>();

  final registrationController = Get.find<RegistrationController>();
  final uploadController = Get.find<UploadController>();
  var forms = [];
  var registeredTeamData = Rxn<RegisterTeamDataDto>();
  var teamNameTextController = TextEditingController();

  var formTitles = [
    "Create your Team",
    "Add your Members",
    "Payment for Registration",
    "Congratulations"
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    teamNameTextController.addListener(() => disabledNextWhen());
    paymentReferrenceIdTextController.addListener(() => disabledNextWhen());
    forms = [
      Obx(
        () => TeamForm(
            teamNameTextController: teamNameTextController,
            uploadLogo: () => uploadTeamLogo(),
            teamLogo: teamLogo.value),
      ),
      Obx(
        () => AddMembersForm(
          onAddMember: () => addMember(),
          members: members.value,
        ),
      ),
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
      TeamRegistrationSuccess()
    ];
  }

  @override
  void next() {
    selectedFormIndex(++selectedFormIndex.value);
    disabledNextWhen();
  }

  @override
  void previous() {
    selectedFormIndex(--selectedFormIndex.value);
    disabledNextWhen();
  }

  @override
  void addMember() async {
    var addedMember = await Get.toNamed("/add-member");
    if (addedMember != null) {
      print(jsonEncode(addedMember));
      var profile = PlayerProfile.fromJson(jsonDecode(jsonEncode(addedMember)));
      members.add(profile);
      disabledNextWhen();
      update();
    }
  }

  @override
  void goBackToHome() {
    selectedFormIndex(0);
    Get.back();
  }

  @override
  void registerTeam() async {
    isLoading(true);

    var payment = RegisterPaymentRequestDto(
        paymentMethod: selectedPaymentMethod.value.name,
        referrenceId: paymentReferrenceIdTextController.text,
        paymentDate: DateTime.now().toUtc());

    var team = RegisterTeamRequestDto(
        name: teamNameTextController.text,
        members: members.map((element) => element.player.id).toList(),
        payment: payment,
        teamCaptainId: dataContextController.playerProfile.value!.player.id,
        tournamentId: tournamentDetailsController.selectedTournament.value!.id);

    var registeredTeam = await registrationController.registerTeam(team);

    if (registeredTeam.data != null) {
      registeredTeamData(registeredTeam.data);
      var uploadedTeamLogo = await uploadController.uploadMobileTeamLogo(
          UploadMobileTeamLogoRequestDto(
              teamId: registeredTeam.data!.team.id,
              logoImageFile: teamLogo.value!));

      if (!uploadedTeamLogo.isUploaded) {
        Get.snackbar("Failed to Team Logo", uploadedTeamLogo.message);
      }

      if (uploadedTeamLogo.isUploaded) {
        var uploadedProofOfPayment = await uploadController
            .uploadMobileProofOfPayment(UploadMobileProofOfPaymentRequestDto(
                paymentId: registeredTeam.data!.registration.paymentId,
                paymentImage: proofOfPayment.value!));
        if (!uploadedProofOfPayment.isUploaded) {
          Get.snackbar("Failed to upload Proof of Payment",
              uploadedProofOfPayment.message);
        }

        if (uploadedProofOfPayment.isUploaded) {
          selectedFormIndex(++selectedFormIndex.value);
        }
      }
    }

    isLoading(false);
  }

  @override
  Future<void> uploadProofOfPayment() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    final imageTemp = File(image.path);
    proofOfPayment(imageTemp);
    disabledNextWhen();
    update();
  }

  @override
  Future<void> uploadTeamLogo() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    final imageTemp = File(image.path);
    teamLogo(imageTemp);
    disabledNextWhen();
    update();
  }

  @override
  void addMemberToTeam(PlayerProfile profile) {
    members.add(profile);
    members.refresh();
  }

  @override
  void resetForm() {
    selectedFormIndex(0);
    Get.back(result: registeredTeamData);
  }

  @override
  void selectPaymentMethod(PaymentMethodEnum method) {
    selectedPaymentMethod(method);
  }

  @override
  void disabledNextWhen() {
    switch (selectedFormIndex.value) {
      case 0:
        print("disabling");
        disabledNext(teamNameTextController.value.text.isEmpty ||
            teamLogo.value == null);
        break;

      case 1:
        print("disabling");
        disabledNext(members.length != 4);
        break;

      case 2:
        print("disabling");
        disabledNext(paymentReferrenceIdTextController.text.isEmpty ||
            proofOfPayment.value == null);
        break;

      default:
    }
  }
}
