import 'package:get/get.dart';

import '../../dto/model/leader-board-dto.dart';
import '../../dto/response/lookup-leader-board-response-dto.dart';

abstract class ILeaderBoardScreenController extends GetxController {
  void initialize();
  Future<void> loadLeaderBoard();
  Future<void> loadDivisions();
  void updateLeaderBoard(List<DivisionLeaderBoard> data);
}
