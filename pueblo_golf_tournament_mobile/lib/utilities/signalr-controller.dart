import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-leader-board-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/leader-board-screen/controller.dart';

// Import the library.
import 'package:signalr_netcore/signalr_client.dart';

import '../dto/response/receive-leader-board-update-response-dto.dart';
import 'constants.dart';

abstract class ISignalRController extends GetxController {
  void connect();
  void disConnect();
  void onCloseConnection(String exception);
  void onReceiveTestMessage(List<Object?>? arguments);
  void onReceiveLeaderBoardUpdates(List<Object?>? arguments);
}

class SignalRController extends ISignalRController {
  var isConnected = false.obs;
  var hubConnection = Rxn<HubConnection>();
  final leaderBoardController = Get.find<LeaderBoardScreenController>();
  SignalRController() {
    hubConnection(HubConnectionBuilder()
        .withUrl(FlavorConfig.instance.variables["signalRHubApi"])
        .build());
    hubConnection.value
        ?.onclose(({error}) => onCloseConnection(error.toString()));
    hubConnection.value!.on(SignalRMethods.receiveTestMessage,
        (arguments) => onReceiveTestMessage(arguments));
    hubConnection.value!.on(SignalRMethods.receiveLeaderBoardUpdates,
        (arguments) => onReceiveLeaderBoardUpdates(arguments));
  }

  @override
  void onCloseConnection(String exception) {
    if (kDebugMode) {
      print(exception);
    }
  }

  @override
  void connect() {
    hubConnection.value!.start()!.then((value) {
      print("Connected to hub");
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

  @override
  void disConnect() {
    hubConnection.value!.stop();
  }

  @override
  void onReceiveLeaderBoardUpdates(List<Object?>? arguments) {
    try {
      for (var element in arguments!) {
        var stringed = jsonEncode(element);
        var parsedData =
            ReceiveLeaderBoardUpdateResponseDto.fromJson(jsonDecode(stringed));
        leaderBoardController.updateLeaderBoard(parsedData.data);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onReceiveTestMessage(List<Object?>? arguments) {
    for (var element in arguments!) {
      print(element);
    }
  }
}
