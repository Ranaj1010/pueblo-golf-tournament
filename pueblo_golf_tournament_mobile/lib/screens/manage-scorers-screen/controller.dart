import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/manage/imanage-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-scorer-profile-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-scorer-profile-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/manage-scorers-screen/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/controller.dart';

class ManageScorersScreenController extends IManageScorersScreenController {
  var isLoadingScorers = false.obs;
  var scorers = <ScorerProfile>[].obs;
  final lookupController = Get.find<LookupController>();
  final tournamentDetailsController =
      Get.find<TournamentDetailsScreenController>();
  @override
  void initialize() {
    loadScorers();
  }

  @override
  void loadScorers() async {
    isLoadingScorers(true);
    scorers.clear();
    try {
      var response = await lookupController.lookupScorerProfile(
          LookupScorerProfilesRequestDto(
              tournamentId:
                  tournamentDetailsController.selectedTournament.value!.id));
      if (response.data.isNotEmpty) {
        scorers.addAll(response.data);
      }
    } catch (e) {
      Get.snackbar("Failed", "Something went wrong. Please try again later.");
    }

    isLoadingScorers(false);
  }

  @override
  void registerNewScorer() {
    Get.toNamed("/add-tournament-scorer");
  }
}
