import 'dart:convert';

import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/upload/iupload-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/upload-mobile-proof-of-payment-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/upload-mobile-team-logo-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/upload-mobile-proof-of-payment-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/upload-mobile-team-logo-response-dto.dart';

import '../../utilities/http-controller.dart';

class UploadController extends IUploadController {
  var controller = "/api/v1/upload";
  var httpController = Get.find<HttpController>();

  @override
  Future<UploadMobileProofOfPaymentResponseDto> uploadMobileProofOfPayment(
      UploadMobileProofOfPaymentRequestDto payload) async {
    var endpoint = "$controller/proof-of-payment";
    var fields = {
      "PaymentId": payload.paymentId.toString(),
    };

    var response = await httpController.upload(
        endpoint, "PaymentImage", payload.paymentImage, fields);

    switch (response.statusCode) {
      case 200:
        var responseData = await response.stream.toBytes();
        return UploadMobileProofOfPaymentResponseDto(
            message: response.reasonPhrase!,
            paymentImageUrl: '',
            isUploaded: true);
      case 400:
        var responseData = await response.stream.toBytes();
        print(jsonDecode(String.fromCharCodes(responseData)));
        return UploadMobileProofOfPaymentResponseDto(
            message: response.reasonPhrase!,
            paymentImageUrl: '',
            isUploaded: false);
      default:
        return UploadMobileProofOfPaymentResponseDto(
            message: response.reasonPhrase!,
            paymentImageUrl: '',
            isUploaded: false);
    }
  }

  @override
  Future<UploadMobileTeamLogoResponseDto> uploadMobileTeamLogo(
      UploadMobileTeamLogoRequestDto payload) async {
    var endpoint = "$controller/team-logo";
    var fields = {
      "TeamId": payload.teamId.toString(),
    };

    var response = await httpController.upload(
        endpoint, "LogoImageFile", payload.logoImageFile, fields);

    switch (response.statusCode) {
      case 200:
        return UploadMobileTeamLogoResponseDto(
            message: response.reasonPhrase!, logoUrl: '', isUploaded: true);
      case 400:
        return UploadMobileTeamLogoResponseDto(
            message: response.reasonPhrase!, logoUrl: '', isUploaded: false);
      default:
        return UploadMobileTeamLogoResponseDto(
            message: response.reasonPhrase!, logoUrl: '', isUploaded: false);
    }
  }
}
