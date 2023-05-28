import 'package:json_annotation/json_annotation.dart';

part 'register-payment-request-dto.g.dart';

@JsonSerializable()
class RegisterPaymentRequestDto {
  final String paymentMethod;
  final String referrenceId;
  final DateTime paymentDate;

  RegisterPaymentRequestDto(
      {required this.paymentMethod,
      required this.referrenceId,
      required this.paymentDate});

  factory RegisterPaymentRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterPaymentRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterPaymentRequestDtoToJson(this);
}
