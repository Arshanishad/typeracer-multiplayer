import 'package:flutter_typing_race_multiplayer/utils/socket_client.dart';

class SocketMethods{
final _socketClient=SocketClient.instance.socket;

//create game
// Hey server ,create a game 
void createGame(String nickname){
  if(nickname.isNotEmpty){
    _socketClient?.emit('create-game',{
      'nickname':nickname,
    });
  }
}
}