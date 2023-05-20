import 'package:json_annotation/json_annotation.dart';

import 'base-model.dart';
part 'payment.g.dart';

@JsonSerializable()
class Payment extends BaseModel {
  final String? paymentMethod;
  final String? referrenceId;
  final DateTime paymentDate;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Payment(this.paymentMethod, this.referrenceId, this.paymentDate,
      {required super.id});

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
