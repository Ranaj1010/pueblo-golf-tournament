import 'dart:io';

class UploadMobileTeamLogoRequestDto {
  final int teamId;
  final File logoImageFile;

  UploadMobileTeamLogoRequestDto(
      {required this.teamId, required this.logoImageFile});
}
