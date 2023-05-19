import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/person-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/registration/register-team-dto.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/register-team-screen-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/tournament-details-screen-controller.dart';
import 'package:pueblo_golf_tournament_mobile/models/home-club.dart';
import 'package:pueblo_golf_tournament_mobile/models/player.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';

import '../../api/dtos/player-dto.dart';
import '../../models/person.dart';

class AddMemberScreenController extends GetxController {
  var homeClubTextController = TextEditingController();
  var firstNameTextController = TextEditingController();
  var middleNameTextController = TextEditingController();
  var lastNameTextController = TextEditingController();
  var birthDateTextController = TextEditingController();
  var contactTextController = TextEditingController();
  var emailAddressTextController = TextEditingController();

  var whsIdController = TextEditingController();
  var handicapTextController = TextEditingController();
  var confirmPasswordTextController = TextEditingController();

  var homeClubs = <HomeClub>[
    HomeClub("", "city", "province", "country", name: "Home Club 1", id: 1),
    HomeClub("", "city", "province", "country", name: "Home Club 2", id: 2),
    HomeClub("", "city", "province", "country", name: "Home Club 3", id: 3),
    HomeClub("", "city", "province", "country", name: "Home Club 4", id: 4),
    HomeClub("", "city", "province", "country", name: "Home Club 5", id: 5),
    HomeClub("", "city", "province", "country", name: "Home Club 6", id: 6),
    HomeClub("", "city", "province", "country", name: "Home Club 7", id: 7),
    HomeClub("", "city", "province", "country", name: "Home Club 8", id: 8),
    HomeClub("", "city", "province", "country", name: "Home Club 9", id: 9),
    HomeClub("", "city", "province", "country", name: "Home Club 10", id: 10),
  ].obs;
  var selectedHomeClub = Rxn<HomeClub>();
  var selectedHomeClubText = "".obs;
  final registerTeamScreenController = Get.find<RegisterTeamScreenController>();
  final tournamentDetailsScreenController =
      Get.find<TournamentDetailsScreenController>();

  addMember() {
    var personalDetails = PersonDto(
        firstName: firstNameTextController.text,
        middleName: middleNameTextController.text,
        lastName: lastNameTextController.text,
        birthDate: DateFormat("MMMM dd, yyyy")
            .parse(birthDateTextController.text)
            .toUtc(),
        contactNumber: contactTextController.text,
        emailAddress: emailAddressTextController.text,
        country: "Philippines",
        id: 0);

    var playerDetails = PlayerDto(
        id: 0,
        playerType: PlayerTypeEnum.Member.index,
        handicap: double.parse(handicapTextController.text),
        homeClub: homeClubTextController.text,
        worldHandicapSystemId: whsIdController.text);

    registerTeamScreenController.members.add(TeamMemberRawDto(
        personalDetails: personalDetails, playerDetails: playerDetails));

    Get.back();
  }

  setSelectHomeClub(HomeClub homeClub) {
    selectedHomeClub(homeClub);
  }

  setSelectHomeClubText(String value) {
    selectedHomeClubText(value);
  }
}
