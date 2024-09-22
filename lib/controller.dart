import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:app_for_communication/server.dart';

class ServerController extends GetxController {
  Server? server;
  List<String> serverLogs = [];

  Future<void> startServer() async {
    await server!.start();
  }

  @override
  void onInit() {
    server = Server(onData, onError);
    startServer();
    super.onInit();
  }

  void onData(Uint8List data) {
    final receivedData = String.fromCharCodes(data);
    serverLogs.add(receivedData);
    update();
  }

  void onError(dynamic error) {
    debugPrint("Error: $error");
  }
}
