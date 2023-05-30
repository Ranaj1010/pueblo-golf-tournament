import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/screens/update-member-details-screen/interface.dart';

import '../../api/registration/registration-controller.dart';
import '../../data/context.dart';
import '../../dto/response/lookup-tournament-team-response-dto.dart';
import '../add-team-member-screen/controller.dart';

class UpdateMemberDetailsScreenController
    extends IUpdateMemberDetailScreenController {
  var hasWHSId = false.obs;
  var playerProfile = Rxn<PlayerProfile>();
  var isPasswordPeeked = false.obs;
  var isConfirmPasswordPeeked = false.obs;
  var isLoading = false.obs;
  var selectedFormIndex = 0.obs;
  var forms = [];
  var formTitles = ["Personal", "Contact", "Player", "Congratulations"];
  var firstNameTextController = TextEditingController();
  var middleNameTextController = TextEditingController();
  var lastNameTextController = TextEditingController();
  var birthDateTextController = TextEditingController();
  var mobileNumberTextController = TextEditingController();
  var emailAddressTextController = TextEditingController();
  var homeAddressTextController = TextEditingController();
  var cityTextController = TextEditingController();
  var countryTextController = TextEditingController();
  var homeClubTextController = TextEditingController();
  var worldHandicapSystemIdTextController = TextEditingController();
  final addTeamMemberScreenController =
      Get.find<AddTeamMemberScreenController>();
  final registrationController = Get.find<RegistrationController>();
  final dataContextController = Get.find<DataContextController>();

  @override
  void goBack() {
    // TODO: implement goBack
  }

  @override
  void iHaveWHSId() {
    // TODO: implement iHaveWHSId
  }

  @override
  void next() {
    // TODO: implement next
  }

  @override
  void previous() {
    // TODO: implement previous
  }

  @override
  void registerPlayerProfile() {
    // TODO: implement registerPlayerProfile
  }
}
