import 'package:json_annotation/json_annotation.dart';

part 'lookup-player-profile-request-dto.g.dart';

@JsonSerializable()
class LookupPlayeProfileRequestDto {
  final String playerExternalId;

  LookupPlayeProfileRequestDto({required this.playerExternalId});

  factory LookupPlayeProfileRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LookupPlayeProfileRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LookupPlayeProfileRequestDtoToJson(this);
}

@JsonSerializable()
class LookupPlayeProfileByPersonIdRequestDto {
  final int personId;

  LookupPlayeProfileByPersonIdRequestDto({required this.personId});

  factory LookupPlayeProfileByPersonIdRequestDto.fromJson(
          Map<String, dynamic> json) =>
      _$LookupPlayeProfileByPersonIdRequestDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LookupPlayeProfileByPersonIdRequestDtoToJson(this);
}
