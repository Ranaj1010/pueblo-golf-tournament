import 'package:json_annotation/json_annotation.dart';

import 'base-model.dart';
part 'registration.g.dart';

@JsonSerializable()
class Registration extends BaseModel {
  final double teamId;
  final double teamCaptainId;
  final double tournamentId;
  final double divisionId;
  final int status;
  final DateTime registrationDate;
  final double? paymentId;

  factory Registration.fromJson(Map<String, dynamic> json) =>
      _$RegistrationFromJson(json);

  Registration(this.teamId, this.teamCaptainId, this.tournamentId,
      this.divisionId, this.status, this.registrationDate, this.paymentId,
      {required super.id});

  Map<String, dynamic> toJson() => _$RegistrationToJson(this);
}
