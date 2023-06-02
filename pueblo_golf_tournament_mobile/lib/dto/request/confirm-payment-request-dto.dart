import 'package:json_annotation/json_annotation.dart';

part 'confirm-payment-request-dto.g.dart';

@JsonSerializable()
class ConfirmPaymentRequestDto {
  final int registrationId;

  factory ConfirmPaymentRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ConfirmPaymentRequestDtoFromJson(json);

  ConfirmPaymentRequestDto({required this.registrationId});
  Map<String, dynamic> toJson() => _$ConfirmPaymentRequestDtoToJson(this);
}
