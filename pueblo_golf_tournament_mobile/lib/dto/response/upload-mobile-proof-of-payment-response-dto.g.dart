// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload-mobile-proof-of-payment-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadMobileProofOfPaymentResponseDto
    _$UploadMobileProofOfPaymentResponseDtoFromJson(
            Map<String, dynamic> json) =>
        UploadMobileProofOfPaymentResponseDto(
          message: json['message'] as String,
          paymentImageUrl: json['paymentImageUrl'] as String,
          isUploaded: json['isUploaded'] as bool,
        );

Map<String, dynamic> _$UploadMobileProofOfPaymentResponseDtoToJson(
        UploadMobileProofOfPaymentResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'paymentImageUrl': instance.paymentImageUrl,
      'isUploaded': instance.isUploaded,
    };
