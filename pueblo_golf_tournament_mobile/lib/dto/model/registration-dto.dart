import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/payment-dto.dart';

part 'registration-dto.g.dart';

@JsonSerializable()
class RegistrationDto extends BaseDto {
  final int teamId;
  final int teamCaptainId;
  final int tournamentId;
  final int status;
  final DateTime registrationDate;
  final bool isPayed;
  final int? paymentId;
  final PaymentDto? payment;

  RegistrationDto({
    required super.id,
    required this.teamId,
    required this.teamCaptainId,
    required this.tournamentId,
    required this.status,
    required this.registrationDate,
    required this.isPayed,
    this.paymentId,
    this.payment,
  });

  factory RegistrationDto.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegistrationDtoToJson(this);
}
