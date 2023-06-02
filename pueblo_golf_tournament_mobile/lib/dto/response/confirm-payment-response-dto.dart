import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/payment-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/registration-dto.dart';

part 'confirm-payment-response-dto.g.dart';

@JsonSerializable()
class ConfirmPaymentResponseDto extends BaseResponse {
  final RegistrationDto? registration;
  final PaymentDto? payment;

  factory ConfirmPaymentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ConfirmPaymentResponseDtoFromJson(json);

  ConfirmPaymentResponseDto(
      {required this.registration,
      required this.payment,
      required super.message});
  Map<String, dynamic> toJson() => _$ConfirmPaymentResponseDtoToJson(this);
}
