import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/models/base-model.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';
part 'account.g.dart';

@JsonSerializable()
class Account extends BaseModel {
  final String username;
  final String password;
  final double personId;
  final AccountTypeEnum accountType;

  Account(
      {required this.username,
      required this.password,
      required this.personId,
      required this.accountType,
      required super.id});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
