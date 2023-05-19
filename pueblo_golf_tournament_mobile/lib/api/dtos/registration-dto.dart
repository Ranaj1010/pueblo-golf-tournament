import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';

import '../../models/base-model.dart';
part 'registration-dto.g.dart';

@JsonSerializable()
class RegistrationDto extends BaseModel {
  final int teamId;
  final int teamCaptainId;
  final int tournamentId;
  final int divisionId;
  final int status;
  final DateTime registrationDate;
  final int? paymentId;

  factory RegistrationDto.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDtoFromJson(json);

  RegistrationDto(this.teamId, this.teamCaptainId, this.tournamentId,
      this.divisionId, this.status, this.registrationDate, this.paymentId,
      {required super.id});

  Map<String, dynamic> toJson() => _$RegistrationDtoToJson(this);
}
