import 'package:json_annotation/json_annotation.dart';

part 'register-player-request-dto.g.dart';

@JsonSerializable()
class RegisterPlayerRequestDto {
  final String worldHandicapSystemId;
  final String homeClub;
  final int personId;

  RegisterPlayerRequestDto(
      {required this.worldHandicapSystemId,
      required this.homeClub,
      required this.personId});

  factory RegisterPlayerRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterPlayerRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterPlayerRequestDtoToJson(this);
}
