import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/payment-dto.dart';

import '../model/person-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register-payment-response-dto.g.dart';

@JsonSerializable()
class RegisterPaymentResponseDto extends BaseResponse {
  final PaymentDto? data;

  RegisterPaymentResponseDto({
    required super.message,
    required this.data,
  });
  factory RegisterPaymentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterPaymentResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterPaymentResponseDtoToJson(this);
}
