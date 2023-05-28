import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/upload-mobile-proof-of-payment-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/upload-mobile-team-logo-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/upload-mobile-proof-of-payment-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/upload-mobile-team-logo-response-dto.dart';

abstract class IUploadController extends GetxController {
  Future<UploadMobileProofOfPaymentResponseDto> uploadMobileProofOfPayment(
      UploadMobileProofOfPaymentRequestDto payload);
  Future<UploadMobileTeamLogoResponseDto> uploadMobileTeamLogo(
      UploadMobileTeamLogoRequestDto payload);
}
