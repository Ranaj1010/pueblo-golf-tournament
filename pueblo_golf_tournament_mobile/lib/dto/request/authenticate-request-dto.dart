import 'package:json_annotation/json_annotation.dart';

part 'authenticate-request-dto.g.dart';

@JsonSerializable()
class AuthenticateRequestDto {
  final String username;
  final String password;

  AuthenticateRequestDto({required this.username, required this.password});

  factory AuthenticateRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticateRequestDtoToJson(this);
}
