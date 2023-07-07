import 'package:poketrade/components/carta.dart';
import 'package:poketrade/components/chat_message.dart';

class Chat{

  final String offerente;
  final String ricevente;
  String lastMessage;
  String image;
  String time;
  final List<CartaPokemon> carteDesiderate;
  bool isActive;
  final List<ChatMessage> messagi;

  Chat({required this.image, required this.isActive, required this.lastMessage, required this.offerente, required this.time, required this.ricevente, required this.carteDesiderate, this.messagi=const []});
}