import 'package:pueblo_golf_tournament_mobile/api/dtos/player-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/responses/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/models/person.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/models/player.dart';

part 'authentication-login-dto.g.dart';

@JsonSerializable()
class AuthenticationLoginDto extends BaseResponse {
  final bool authenticated;
  final AuthenticatedUserData? data;
  AuthenticationLoginDto({
    required super.message,
    required this.authenticated,
    this.data,
  });

  factory AuthenticationLoginDto.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationLoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationLoginDtoToJson(this);
}

@JsonSerializable()
class AuthenticatedUserData {
  final Person? personalDetails;
  final PlayerDto? playerDetails;
  final String? userName;

  AuthenticatedUserData(
      {required this.personalDetails,
      this.playerDetails,
      required this.userName});
  factory AuthenticatedUserData.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticatedUserDataToJson(this);
}
