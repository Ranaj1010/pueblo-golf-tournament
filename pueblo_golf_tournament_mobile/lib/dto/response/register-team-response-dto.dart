import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/registration-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/team-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register-team-response-dto.g.dart';

@JsonSerializable()
class RegisterTeamResponseDto extends BaseResponse {
  final RegisterTeamDataDto? data;

  RegisterTeamResponseDto({
    required super.message,
    required this.data,
  });
  factory RegisterTeamResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterTeamResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterTeamResponseDtoToJson(this);
}

@JsonSerializable()
class RegisterTeamDataDto {
  final RegistrationDto registration;
  final TeamDto team;

  RegisterTeamDataDto({required this.registration, required this.team});
  factory RegisterTeamDataDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterTeamDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterTeamDataDtoToJson(this);
}
