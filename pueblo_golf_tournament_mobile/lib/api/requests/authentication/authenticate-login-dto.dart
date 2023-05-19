import 'package:json_annotation/json_annotation.dart';

part 'authenticate-login-dto.g.dart';

@JsonSerializable()
class AuthenticateLoginDto {
  final String username;
  final String password;

  AuthenticateLoginDto({required this.username, required this.password});

  factory AuthenticateLoginDto.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateLoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateLoginDtoToJson(this);
}
