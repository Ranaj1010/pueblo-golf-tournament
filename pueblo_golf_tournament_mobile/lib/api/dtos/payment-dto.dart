import 'package:json_annotation/json_annotation.dart';

import '../../models/base-model.dart';

part 'payment-dto.g.dart';

@JsonSerializable()
class PaymentDto extends BaseModel {
  final String paymentMethod;
  final String referrenceId;
  final DateTime paymentDate;

  factory PaymentDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentDtoFromJson(json);

  PaymentDto({
    required super.id,
    required this.paymentMethod,
    required this.referrenceId,
    required this.paymentDate,
  });

  Map<String, dynamic> toJson() => _$PaymentDtoToJson(this);
}
