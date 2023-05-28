import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/account-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/person-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authenticate-response-dto.g.dart';

@JsonSerializable()
class AuthenticateResponseDto extends BaseResponse {
  final bool authenticated;
  final AuthenticatedUserData? data;
  AuthenticateResponseDto({
    required super.message,
    required this.authenticated,
    required this.data,
  });
  factory AuthenticateResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticateResponseDtoToJson(this);
}

@JsonSerializable()
class AuthenticatedUserData {
  final PersonDto? personalDetails;
  final AccountDto? account;
  final String username;

  AuthenticatedUserData(
      {required this.personalDetails,
      required this.account,
      required this.username});

  factory AuthenticatedUserData.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedUserDataFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticatedUserDataToJson(this);
}
