import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/authenticate-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/authenticate-response-dto.dart';

abstract class IAuthenticationController extends GetxController {
  Future<AuthenticateResponseDto> authenticate(AuthenticateRequestDto payload);
}
