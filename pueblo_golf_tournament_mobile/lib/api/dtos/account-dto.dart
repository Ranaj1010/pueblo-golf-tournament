import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/models/base-model.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';
part 'account-dto.g.dart';

@JsonSerializable()
class AccountDto extends BaseModel {
  final String username;
  final String password;
  final double personId;
  final AccountTypeEnum accountType;

  AccountDto(
      {required this.username,
      required this.password,
      required this.personId,
      required this.accountType,
      required super.id});

  factory AccountDto.fromJson(Map<String, dynamic> json) =>
      _$AccountDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDtoToJson(this);
}
