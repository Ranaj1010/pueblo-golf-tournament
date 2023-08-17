import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-account-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-person-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-scorer-profile-response-dto.dart';

part 'register-scorer-response-dto.g.dart';

@JsonSerializable()
class RegisterScorerResponseDto extends BaseResponse {
  final ScorerProfile? data;

  RegisterScorerResponseDto({required this.data, required super.message});
  factory RegisterScorerResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterScorerResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterScorerResponseDtoToJson(this);
}
