import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:hullu/Repo/Game/SocketResponse.dart';

final gameProvider = ChangeNotifierProvider.autoDispose((ref) => GameProvider());

class GameProvider extends ChangeNotifier {
  bool dataLoading = true;
  Timer? gameCountDown;
  int countDown = 0;
  late IO.Socket socket;
  String gameId = "";
  SocketResponse response = SocketResponse();

  void onInit(int? Id) async {
    gameId = Id.toString();
    connectToSocket();
  }

  void connectToSocket() async {
    socket = IO.io('https://socket.hullu.in', IO.OptionBuilder().setTransports(['websocket']).build());
    socket.connect();

    socket.onConnect((_) {
      print('Connected to socket server');

      socket.on('$gameId', (data) {
        print('Raw data received: $data');
        print('Data type: ${data.runtimeType}');
        try {
          if (data is String) {
            var jsonData = jsonDecode(data);
            response = SocketResponse.fromJson(jsonData);
            print('Decoded JSON data: $jsonData');
            dataLoading=false;
            notifyListeners();
          } else if (data is Map) {
            print('Received event 4 data (map): $data');
          } else if (data is List) {
            print('Received event 4 data (list): $data');
          } else {
            print('Unknown data format: $data');
          }

        } catch (e) {
          print('Error parsing data: $e');
        }
      });
    });

    socket.onDisconnect((_) {
      print('Disconnected from socket server');
    });
  }

  void startTimer() {
    gameCountDown = Timer.periodic(Duration(seconds: 1), (timer) {
      countDown = timer.tick;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    socket.dispose();
    gameCountDown?.cancel();
    super.dispose();
  }
}
