import 'package:flutter/material.dart';
import 'package:poketrade/components/carta.dart';
import 'package:poketrade/components/utente.dart';
import 'package:poketrade/fake_database/database.dart';

class AreaCarteProvider with ChangeNotifier{
  List<Utente> utenti = [
    Utente(id: 1, username: "Cuggio33", immagine: "user3.jpg", email: "enri.cugg33@gmail.com", areaCarte: [
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[8], condizione: "Buono", prezzo: 23),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[7], condizione: "Come nuovo", prezzo: 50),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[2], condizione: "Decente", prezzo: 47),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[11], condizione: "Buono", prezzo: 22),
    ]),
    Utente(id: 2, username: "Infrizzi26", immagine: "user1.jpg",email: "luca.patacchino26@gmail.com", areaCarte: [
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[1], condizione: "Decente", prezzo: 75),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[5], condizione: "Come nuovo", prezzo: 64),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[6], condizione: "Buono", prezzo: 90),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[9], condizione: "Buono", prezzo: 17.5),
    ]),
    Utente(id: 3, username: "Moscao13", immagine: "user2.jpg", email: "matt.mosc@gmail.com", areaCarte: []),
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

    return null;
  }

  int? getIndexUtenteByUsername(String username){
    for(var i = 0; i < utenti.length; i++){
      if(utenti[i].username == username){
        return i;
      }
    }

    return null;
  }

}