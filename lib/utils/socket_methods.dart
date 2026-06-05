import 'package:typeracer/utils/socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket;

  /// CREATE ROOM
  void createGame(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient?.emit('create-game', {
        'nickname': nickname,
      });
    }
  }

  /// JOIN ROOM
  void joinGame(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient?.emit('join-game', {
        'nickname': nickname,
        'roomId': roomId,
      });
    }
  }

  /// START GAME (HOST)
  void startGame(String roomId) {
    _socketClient?.emit('start-game', {
      'roomId': roomId,
    });
  }

  /// SEND PROGRESS
  void sendProgress(String roomId, double progress) {
    _socketClient?.emit('update-progress', {
      'roomId': roomId,
      'progress': progress,
    });
  }

  /// LISTEN: ROOM CREATED
  void onCreateGame(Function(Map<String, dynamic>) callback) {
    _socketClient?.on('create-game-success', (data) {
      callback(data);
    });
  }

  /// LISTEN: PLAYER JOINED
  void onPlayerJoined(Function(Map<String, dynamic>) callback) {
    _socketClient?.on('player-joined', (data) {
      callback(data);
    });
  }

  /// LISTEN: GAME START
  void onGameStart(Function(Map<String, dynamic>) callback) {
    _socketClient?.on('game-started', (data) {
      callback(data);
    });
  }

  /// LISTEN: PROGRESS UPDATE
  void onProgressUpdate(Function(Map<String, dynamic>) callback) {
    _socketClient?.on('progress-update', (data) {
      callback(data);
    });
  }

  /// LISTEN: GAME END
  void onGameEnd(Function(Map<String, dynamic>) callback) {
    _socketClient?.on('game-ended', (data) {
      callback(data);
    });
  }
}