import 'package:poketrade/components/carta.dart';

class Utente{

  late int id;
  late String username;
  late String email;
  late String immagine;
  late List<CartaPokemon> areaCarte;

  Utente({required this.id, required this.username, this.immagine="default.jpg",required this.email, required this.areaCarte});
}