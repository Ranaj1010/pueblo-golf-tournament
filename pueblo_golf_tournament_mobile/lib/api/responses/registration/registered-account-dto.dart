import 'package:pueblo_golf_tournament_mobile/api/dtos/person-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/player-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/responses/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/models/person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registered-account-dto.g.dart';

@JsonSerializable()
class RegisteredAccountDto extends BaseResponse {
  final RegisteredAccountData? data;
  RegisteredAccountDto(this.data, {required super.message});

  factory RegisteredAccountDto.fromJson(Map<String, dynamic> json) =>
      _$RegisteredAccountDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisteredAccountDtoToJson(this);
}

@JsonSerializable()
class RegisteredAccountData {
  final PersonDto? person;
  final PlayerDto? player;
  factory RegisteredAccountData.fromJson(Map<String, dynamic> json) =>
      _$RegisteredAccountDataFromJson(json);

  RegisteredAccountData({this.person, this.player});

  Map<String, dynamic> toJson() => _$RegisteredAccountDataToJson(this);
}
