import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;

  // Private static variable
  static SocketClient? _instance;

  // Private constructor
  SocketClient._internal() {
    socket = IO.io('http://192.168.31.21:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket!.connect();
  }

  // Public getter to access instance
  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}