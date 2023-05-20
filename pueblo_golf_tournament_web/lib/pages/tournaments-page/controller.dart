import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pueblo_golf_tournament_web/api/lookups/controller.dart';
import 'package:pueblo_golf_tournament_web/models/tournament.dart';

import '../../api/lookups/requests/lookup-tournament-request-dto.dart';

class TournamentsScreenController extends GetxController {
  var tournaments = <Tournament>[].obs;
  final lookupController = Get.find<LookupController>();

  var nameTextController = TextEditingController();
  var startDateTextController = TextEditingController();
  var endDateTextController = TextEditingController();
  var venuePlaceTextController = TextEditingController();
  var venuAddressTextControler = TextEditingController();
  var venuCityTextControler = TextEditingController();
  var numberOfLotsTextControler = TextEditingController();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await loadTournaments();
  }

  loadTournaments() async {
    tournaments.clear();
    var response = await lookupController
        .lookupTournaments(LookupTournamentRequestDto(""));

    tournaments.addAll(response.data.map((e) => Tournament(
        name: e.name,
        bannerPhoto: e.bannerPhoto,
        startDate: e.startDate,
        endDate: e.endDate,
        numberOfSlots: e.numberOfSlots,
        venuePlace: e.venuePlace,
        venueCity: e.venueCity,
        venueAddress: e.venueAddress,
        venueCountry: e.venueCountry,
        id: e.id)));
  }

  addTournament() {}
}
