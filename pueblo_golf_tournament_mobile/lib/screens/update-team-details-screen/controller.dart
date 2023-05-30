import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pueblo_golf_tournament_mobile/screens/update-team-details-screen/interface.dart';

import '../../dto/response/lookup-tournament-team-response-dto.dart';

class UpdateTeamDetailsScreenControlelr
    extends IUpdateTeamDetailsScreenController {
  var teamNameEditingController = TextEditingController();
  var teamLogo = Rxn<File>();
  var proofOfPayment = Rxn<File>();
  var members = <PlayerProfile>[].obs;

  @override
  void saveTeamDetails() {
    // TODO: implement saveTeamDetails
  }

  @override
  void uploadTeamLogo() async {
    if (kIsWeb) {
      var picked = await FilePicker.platform.pickFiles();

      if (picked != null) {
        final imageTemp = File(picked.files.first.path!);
        teamLogo(imageTemp);
        update();
      }
    } else {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }

      final imageTemp = File(image.path);
      teamLogo(imageTemp);
      update();
    }
  }

  @override
  void deleteTeamMember(PlayerProfile member) {
    members.remove(member);
  }

  @override
  void updateTeamMember(PlayerProfile member) {
    members.assign(member);
  }

  @override
  void openEditScreenForTeamMember(PlayerProfile member) {
    // TODO: implement openEditScreenForTeamMember
  }
}
