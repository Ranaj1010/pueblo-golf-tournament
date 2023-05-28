import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload-mobile-team-logo-response-dto.g.dart';

@JsonSerializable()
class UploadMobileTeamLogoResponseDto extends BaseResponse {
  final String logoUrl;
  final bool isUploaded;

  UploadMobileTeamLogoResponseDto({
    required super.message,
    required this.logoUrl,
    required this.isUploaded,
  });
  factory UploadMobileTeamLogoResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UploadMobileTeamLogoResponseDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$UploadMobileTeamLogoResponseDtoToJson(this);
}
