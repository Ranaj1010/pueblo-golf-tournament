import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/division-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

abstract class IRegisteredTeamDetailsScreenControler extends GetxController {
  void goBack();
  void selectedRegisteredTeam(RegisteredTeam team);
  void updateTeamDetails();
  void uploadRegistrationPayment();
  void viewMemberDetails(PlayerProfile playerProfile);
  void payRegistration();
  void confirmRegistrationPayment();
  void bookTeamSchedule();
  void loadTeamRegistration();
  void previewPaymentImage();
  void addMember();
  void editTeamName();
  void saveTeamName();
  void assignToDivision();
  void saveAssignedTeamToDivision(DivisionDto division);
  void initialize();
  void loadDivisions();
}
