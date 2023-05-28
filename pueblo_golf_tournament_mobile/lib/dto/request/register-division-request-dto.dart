import 'package:json_annotation/json_annotation.dart';

part 'register-division-request-dto.g.dart';

@JsonSerializable()
class RegisterDivisionRequestDto {
  final String name;
  final int tournamentId;

  RegisterDivisionRequestDto({required this.name, required this.tournamentId});

  factory RegisterDivisionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDivisionRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterDivisionRequestDtoToJson(this);
}
