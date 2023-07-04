import 'package:poketrade/components/carta.dart';

class Chat{

  final String offerente;
  final String ricevente;
  final String lastMessage;
  final String image;
  final String time;
  final List<CartaPokemon> carteDesiderate;
  final bool isActive;

  Chat({required this.image, required this.isActive, required this.lastMessage, required this.offerente, required this.time, required this.ricevente, required this.carteDesiderate});
}