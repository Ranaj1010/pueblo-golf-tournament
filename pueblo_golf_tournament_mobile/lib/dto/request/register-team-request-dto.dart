import 'package:pueblo_golf_tournament_mobile/dto/request/register-payment-request-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register-team-request-dto.g.dart';

@JsonSerializable()
class RegisterTeamRequestDto {
  final int tournamentId;
  final int teamCaptainId;
  final String name;
  final RegisterPaymentRequestDto payment;
  final List<int> members;

  RegisterTeamRequestDto(
      {required this.tournamentId,
      required this.teamCaptainId,
      required this.name,
      required this.payment,
      required this.members});
  factory RegisterTeamRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterTeamRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterTeamRequestDtoToJson(this);
}
