import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/person-dto.dart';

import 'package:json_annotation/json_annotation.dart';

part 'account-dto.g.dart';

@JsonSerializable()
class AccountDto extends BaseDto {
  final String username;
  final int personId;
  final int accountType;
  final PersonDto? person;
  AccountDto({
    required super.id,
    required this.username,
    required this.personId,
    required this.accountType,
    required this.person,
  });

  factory AccountDto.fromJson(Map<String, dynamic> json) =>
      _$AccountDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDtoToJson(this);
}
