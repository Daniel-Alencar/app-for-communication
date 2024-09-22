import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

typedef Unit8ListCallback = Function(Uint8List data);
typedef DynamicCallback = Function(dynamic data);

class Server {
  Unit8ListCallback? onData;
  DynamicCallback? onError;

  Server(this.onData, this.onError);

  ServerSocket? server;
  bool running = false;
  List<Socket> sockets = [];

  Future<void> start() async {
    runZoned(() async {
      server = await ServerSocket.bind("192.168.0.165", 4000);
      running = true;
      server!.listen(onRequest);
      const message = "Server is listening!";
      onData!(Uint8List.fromList(message.codeUnits));
      // ignore: deprecated_member_use
    }, onError: onError);
  }

  void onRequest(Socket socket) {
    if (!sockets.contains(socket)) {
      sockets.add(socket);
    }
    socket.listen((event) {
      onData!(event);
    });
  }
}
