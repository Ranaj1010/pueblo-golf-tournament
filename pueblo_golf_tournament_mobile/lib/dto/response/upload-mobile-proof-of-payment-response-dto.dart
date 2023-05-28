import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload-mobile-proof-of-payment-response-dto.g.dart';

@JsonSerializable()
class UploadMobileProofOfPaymentResponseDto extends BaseResponse {
  final String paymentImageUrl;
  final bool isUploaded;

  UploadMobileProofOfPaymentResponseDto({
    required super.message,
    required this.paymentImageUrl,
    required this.isUploaded,
  });
  factory UploadMobileProofOfPaymentResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$UploadMobileProofOfPaymentResponseDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$UploadMobileProofOfPaymentResponseDtoToJson(this);
}
