import 'package:poketrade/components/carta_template.dart';

class CartaPokemon{
  late int idAnnuncio;
  late CartaTemplate carta;
  late double? prezzo;
  late String condizione;
  late String proprietario;
  late List<String>? foto;

  CartaPokemon({required this.idAnnuncio, required this.carta, this.foto, this.prezzo, required this.condizione, this.proprietario="default.jpg"});

}
