import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/lookup/lookup-tournament-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/service/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/tournament-details-screen-controller.dart';
import 'package:pueblo_golf_tournament_mobile/models/tournament.dart';

class DashboardPageController extends GetxController {
  var tournaments = <Tournament>[].obs;

  final lookupTournament = Get.find<LookupController>();
  final tournamentDetailsController =
      Get.find<TournamentDetailsScreenController>();

  @override
  void onInit() {
    super.onInit();
    loadTournaments();
  }

  loadTournaments() async {
    var response = await lookupTournament
        .lookupTournaments(LookupTournamentRequestDto(""));

    tournaments.addAll(response.data.map((e) => new Tournament(
        name: e.name,
        bannerPhoto: e.bannerPhoto,
        startDate: DateTime.parse(e.startDate!),
        endDate: DateTime.parse(e.endDate!),
        numberOfSlots: e.numberOfSlots,
        venuePlace: e.venuePlace,
        venueCity: e.venueCity,
        venueAddress: e.venueAddress,
        venueCountry: e.venueCountry,
        id: e.id)));
  }

  selectTournament(Tournament tournament) {
    tournamentDetailsController.selectedTournament(tournament);
    tournamentDetailsController.loadDivisions(tournament.id);

    Get.toNamed("/tournament-details");
  }
}
