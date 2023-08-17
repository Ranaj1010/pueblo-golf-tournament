import 'package:get/get.dart';

abstract class IAddTournamentScorerScreenController extends GetxController {
  void initialize();
  void registerScorer();
  void peekPassword();
  void peekConfirmPassword();
  void back();
  void previous();
  void next();
}
