import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';

abstract class ISetupTournamentHolesScreenController extends GetxController {
  void initialize();
  void loadEighteenHoles();
  void saveHoles();
  void updateMaximumHole(int index, int value);
}
