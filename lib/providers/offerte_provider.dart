import 'package:flutter/material.dart';
import 'package:poketrade/components/carta.dart';
import 'package:poketrade/components/offerta.dart';
import 'package:poketrade/fake_database/database.dart';

class OfferteProvider with ChangeNotifier{
  List<Offerta> offerte = [
    Offerta(
        offerente: "Infrizzi26",
        ricevente: "Cuggio33",
        carteDesiderate: [
          CartaPokemon(idAnnuncio: counter++, carta: cartedb[7], condizione: "Buono", foto: ["groudon.jpg"]),
          CartaPokemon(idAnnuncio: counter++, carta: cartedb[2], condizione: "Buono", foto: ["victini.jpg"]),
        ],
        contropartita: ContropartitaScambio(carteOfferte: [
          CartaPokemon(idAnnuncio: counter++, carta: cartedb[5], condizione: "Buono", foto: ["pickachu_1.jpg"]),
          CartaPokemon(idAnnuncio: counter++, carta: cartedb[6], condizione: "Buono", foto: ["pickachu_1.jpg"]),
        ]),
    ),
  ];
}