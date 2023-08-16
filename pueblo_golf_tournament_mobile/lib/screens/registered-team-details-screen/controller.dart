import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/manage/manage-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/division-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/team-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/confirm-payment-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-division-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-team-division-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-tournament-player-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/update-team-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/pay-registration-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/view-team-member-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-elevated-button.dart';

import '../../dto/request/lookup-tournament-team-request-dto.dart';
import 'interface.dart';

class RegisteredTeamDetailsScreenController
    extends IRegisteredTeamDetailsScreenControler {
  var isConfirming = false.obs;
  var isAssigningToDivision = false.obs;
  var registeredTeam = Rxn<RegisteredTeam>();
  var selectedMember = Rxn<PlayerProfile>();
  var isSavingsNewName = false.obs;
  var editTeamNameTextController = TextEditingController();
  var divisions = <DivisionDto>[];
  final editTeamNameFormKey = GlobalKey<FormState>();
  final lookupController = Get.find<LookupController>();
  final manageController = Get.find<ManageController>();
  final registrationController = Get.find<RegistrationController>();

  var baseUrl = "";

  RegisteredTeamDetailsScreenController() {
    baseUrl =
        "http://${FlavorConfig.instance.variables["baseUrl"] ?? dotenv.env["BASE_URL"]}";
  }

  @override
  void goBack() {
    Get.back();
  }

  @override
  void selectedRegisteredTeam(RegisteredTeam team) {
    registeredTeam(team);
    loadTeamRegistration();
  }

  @override
  void uploadRegistrationPayment() {
    // TODO: implement uploadRegistrationPayment
  }

  @override
  void updateTeamDetails() {
    // TODO: implement updateTeamDetails
  }

  @override
  void viewMemberDetails(PlayerProfile playerProfile) {
    selectedMember(playerProfile);
    var updatedMember = Get.toNamed("/member-details");
  }

  @override
  void payRegistration() {
    var payment = Get.toNamed("/pay-registration");
    if (payment != null) {
      loadTeamRegistration();
    }
  }

  @override
  void loadTeamRegistration() async {
    editTeamNameTextController.clear();
    var response = await lookupController.lookupTournamentTeam(
        LookupTournamentTeamRequestDto(
            tournamentId: registeredTeam.value!.registration.tournamentId,
            teamCaptainId: registeredTeam.value!.captainProfile.player.id));
    if (response.registeredTeams.isNotEmpty) {
      registeredTeam(response.registeredTeams.first);
      editTeamNameTextController.text =
          response.registeredTeams.first.team.name;

      if (response.registeredTeams.first.division == null) {
        loadDivisions();
      }
    }
  }

  @override
  void confirmRegistrationPayment() async {
    isConfirming(true);
    try {
      var confirmPayment = await manageController.confirmPayment(
          ConfirmPaymentRequestDto(
              registrationId: registeredTeam.value!.registration.id));

      if (confirmPayment.payment != null) {
        loadTeamRegistration();
        Get.snackbar("Registration Confirmed",
            "This team is now registered for the tournament.");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Failed to confirm registration",
          "Something went wrong. Please try again.");
    }
    isConfirming(false);
  }

  @override
  void previewPaymentImage() {
    print(registeredTeam.value!.payment!.paymentReferrencePhoto);
    Get.defaultDialog(
        title: "Preview",
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.network(
              baseUrl + registeredTeam.value!.payment!.paymentReferrencePhoto,
              errorBuilder: (context, exception, stacktrace) => Container(
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 230, 230, 230)),
                  child: const Center(
                      child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      Icon(Icons.image_not_supported_outlined, size: 20),
                      Text("Image not found."),
                    ],
                  )))),
        ));
  }

  @override
  void addMember() async {
    var addedMember = await Get.toNamed("/register-player");
    if (addedMember != null) {
      print(jsonEncode(addedMember));

      var profile = PlayerProfile.fromJson(jsonDecode(jsonEncode(addedMember)));

      var addedPlayer = await registrationController.registerTournamentPlayer(
          RegisterTournamentPlayerRequestDto(
              registrationId: registeredTeam.value!.registration.id,
              teamId: registeredTeam.value!.registration.teamId,
              tournamentId: registeredTeam.value!.registration.tournamentId,
              playerId: profile.player.id));

      loadTeamRegistration();
      Get.snackbar("Member added",
          "${profile.person.firstName} ${profile.person.lastName} is now added to the team.");
      update();
    }
  }

  @override
  void bookTeamSchedule() {
    Get.toNamed("/book-team-schedule");
  }

  @override
  void editTeamName() {
    Get.defaultDialog(
        title: "Update Name",
        titlePadding: const EdgeInsets.only(top: 20, bottom: 10),
        contentPadding: const EdgeInsets.all(20),
        content: SizedBox(
          width: double.maxFinite - 40,
          child: Form(
              key: editTeamNameFormKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required.';
                  }
                  return null;
                },
                controller: editTeamNameTextController,
                decoration: const InputDecoration(hintText: "Enter Name"),
              )),
        ),
        confirm: Obx(
          () => BrandElevatedButton(
              onPressed: () => saveTeamName(),
              title: "Save",
              loading: isSavingsNewName.value),
        ));
  }

  @override
  void saveTeamName() async {
    if (editTeamNameFormKey.currentState!.validate()) {
      isSavingsNewName(true);

      var response = await manageController.updateTeam(UpdateTeamRequestDto(
          team: TeamDto(
              id: registeredTeam.value!.team.id,
              name: editTeamNameTextController.text,
              logoUrl: registeredTeam.value!.team.logoUrl,
              teamCaptainId: registeredTeam.value!.team.teamCaptainId)));

      if (response.data != null) {
        loadTeamRegistration();
        Get.back();
      }

      isSavingsNewName(false);
    }
  }

  @override
  void assignToDivision() {
    // TODO: implement assignToDivision
    Get.bottomSheet(
        SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 10,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20, bottom: 20),
                  child: Text(
                    "Select Division",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                          title: Text(divisions[index].name),
                          onTap: () => Get.defaultDialog(
                              title: "Confirm?",
                              contentPadding: const EdgeInsets.all(20),
                              confirm: SizedBox(
                                  width: 100,
                                  child: Obx(
                                    () => BrandElevatedButton(
                                        onPressed: () =>
                                            saveAssignedTeamToDivision(
                                                divisions[index]),
                                        title: "Yes",
                                        loading: isAssigningToDivision.value),
                                  )),
                              cancel: SizedBox(
                                width: 100,
                                child: TextButton(
                                    onPressed: () => Get.back(),
                                    child: const Text("No")),
                              ),
                              content: Text(
                                "Are you sure you want to assign this team to ${divisions[index].name}?",
                                textAlign: TextAlign.center,
                              )),
                        ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: divisions.length)
              ],
            ),
          ),
        ),
        useRootNavigator: true,
        enableDrag: true,
        isDismissible: true,
        backgroundColor: Colors.white);
  }

  @override
  void saveAssignedTeamToDivision(DivisionDto division) async {
    // TODO: implement saveAssignedTeamToDivision
    isAssigningToDivision(true);

    try {
      var response = await registrationController.registerTeamDivision(
          RegisterTeamDivisionRequestDto(
              tournamentId: registeredTeam.value!.registration.tournamentId,
              teamId: registeredTeam.value!.team.id,
              divisionId: division.id));

      if (response.data != null) {
        loadTeamRegistration();
        Get.back();
        Get.back();
        Get.snackbar("Success", "Team is now assigned to ${division.name}");
      }

      if (response.data == null) {
        Get.back();
        Get.snackbar("Failed", response.message);
      }
    } catch (e) {
      Get.snackbar("Failed", "Something went wrong. Please try again later.");
    }

    isAssigningToDivision(false);
  }

  @override
  void initialize() {
    loadTeamRegistration();
  }

  @override
  void loadDivisions() async {
    var response = await lookupController.lookupDivisions(
        LookupDivisionRequestDto(
            filterName: "",
            tournamentId: registeredTeam.value!.registration.tournamentId));

    if (response.data!.isNotEmpty) {
      divisions.addAll(response.data!);
    }
  }
}
