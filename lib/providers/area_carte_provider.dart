import 'package:flutter/material.dart';
import 'package:poketrade/components/carta.dart';
import 'package:poketrade/components/utente.dart';
import 'package:poketrade/fake_database/database.dart';

class AreaCarteProvider with ChangeNotifier{
  List<Utente> utenti = [
    Utente(id: 1, username: "Cuggio33", immagine: "user3.jpg", email: "enri.cugg33@gmail.com", areaCarte: [
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[8], condizione: "Buono", prezzo: 23),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[7], condizione: "Buono"),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[2], condizione: "Buono"),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[11], condizione: "Buono"),
    ]),
    Utente(id: 2, username: "Infrizzi26", email: "luca.patacchino26@gmail.com", areaCarte: [
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[1], condizione: "Buono"),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[5], condizione: "Buono"),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[6], condizione: "Buono"),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[9], condizione: "Buono"),
    ]),
    Utente(id: 3, username: "Moscao13", email: "matt.mosc@gmail.com", areaCarte: []),
  ];

  aggiungiCarta(CartaPokemon carta, String username){
    for(var i = 0; i < utenti.length; i++){
      if(utenti[i].username == username){
        utenti[i].areaCarte.add(carta);
        break;
      }
    }
    notifyListeners();
  }

  Utente? getUtenteByUsername(String username){
    for(var i = 0; i < utenti.length; i++){
      if(utenti[i].username == username){
        return utenti[i];
      }
    }
  }

}