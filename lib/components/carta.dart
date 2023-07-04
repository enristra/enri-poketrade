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

List carte_scambio = [
  //CartaPokemon(nome: "Groudon", edizione: "Edizione1",prezzo: 35.0, image: "groudon.jpg", condizione: "Come nuovo"),
  //CartaPokemon(prezzo: 35.0, image: "mewtwo.jpg", condizione: "Buono"),
  //CartaPokemon(prezzo: 35.0, image: "axew.jpg", condizione: "Decente"),
  //CartaPokemon(prezzo: 35.0, image: "pickachu_1.jpg", condizione: "Come nuovo"),
];