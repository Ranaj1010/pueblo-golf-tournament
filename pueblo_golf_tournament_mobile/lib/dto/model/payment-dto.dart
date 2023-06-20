import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';

import 'package:json_annotation/json_annotation.dart';

part 'payment-dto.g.dart';

@JsonSerializable()
class PaymentDto extends BaseDto {
  final String paymentMethod;
  final String paymentReferrencePhoto;
  final int? paymentChannelAccountId;
  final String? accountNumber;
  final String? accountName;
  final String referrenceId;
  final DateTime paymentDate;
  PaymentDto({
    required super.id,
    required this.paymentMethod,
    required this.paymentChannelAccountId,
    required this.paymentReferrencePhoto,
    required this.referrenceId,
    required this.paymentDate,
    required this.accountNumber,
    required this.accountName,
  });

  factory PaymentDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentDtoToJson(this);
}
