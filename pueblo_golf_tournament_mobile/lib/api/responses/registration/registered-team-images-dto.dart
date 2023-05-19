import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/api/responses/base-response.dart';

part 'registered-team-images-dto.g.dart';

@JsonSerializable()
class RegisteredTeamImagesDto extends BaseResponse {
  final String paymentImageUrl;
  final String logoImageUrl;
  RegisteredTeamImagesDto({
    required super.message,
    required this.paymentImageUrl,
    required this.logoImageUrl,
  });

  factory RegisteredTeamImagesDto.fromJson(Map<String, dynamic> json) =>
      _$RegisteredTeamImagesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisteredTeamImagesDtoToJson(this);
}
