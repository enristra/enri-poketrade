import 'package:flutter/material.dart';
import 'package:poketrade/components/carta.dart';

import 'package:poketrade/components/carta_template.dart';
import 'package:poketrade/components/chat.dart';
import 'package:poketrade/components/chat_message.dart';
import 'package:poketrade/components/offerta.dart';

int counter = 1;

  List<String> edizioni = [
    "Edizione1",
    "Edizione2",
    "Edizione3",
    "Edizione4",
  ];

  List<String> condizioni = [
    "Condizione1",
    "Condizione2",
    "Condizione3",
    "Condizione4",
  ];

  List<CartaTemplate> cartedb = [
    CartaTemplate(id: 1, nome: "Pikachu", edizione: "Edizione1", immagine: "pickachu_1.jpg", valore: 15),
    CartaTemplate(id: 2, nome: "Victini", edizione: "Edizione2", immagine: "victini.jpg", valore: 30),
    CartaTemplate(id: 3, nome: "Lucario", edizione: "Edizione1", immagine: "pickachu_1.jpg", valore: 12),
    CartaTemplate(id: 4, nome: "Lucario", edizione: "Edizione2", immagine: "pickachu_1.jpg", valore: 20),
    CartaTemplate(id: 5, nome: "Lucario", edizione: "Edizione3", immagine: "pickachu_1.jpg", valore: 32),
    CartaTemplate(id: 6, nome: "Lucario", edizione: "Edizione4", immagine: "pickachu_1.jpg", valore: 50),
    CartaTemplate(id: 7, nome: "Groudon", edizione: "Edizione4", immagine: "groudon.jpg", valore: 150),
    CartaTemplate(id: 8, nome: "Axew", edizione: "Edizione1", immagine: "axew.jpg", valore: 10),
    CartaTemplate(id: 9, nome: "Melmetal", edizione: "Edizione3", immagine: "melmetal.jpg", valore: 80),
    CartaTemplate(id: 10, nome: "Mewtwo", edizione: "Edizione4", immagine: "mewtwo.jpg", valore: 120),
    CartaTemplate(id: 11, nome: "Snorlax", edizione: "Edizione2", immagine: "snorlax.jpg", valore: 30),
    CartaTemplate(id: 12, nome: "Regirock", edizione: "Edizione1", immagine: "regirock.jpg", valore: 20),
  ];

  List<DropdownMenuEntry<CartaTemplate>> cartedbentries = cartedb.map((CartaTemplate e) => DropdownMenuEntry<CartaTemplate>(value: e, label: "${e.nome} : ${e.edizione}")).toList();
  List<DropdownMenuEntry<String>> edizionientries = edizioni.map((String e) => DropdownMenuEntry<String>(value: e, label: e)).toList();
  List<DropdownMenuEntry<String>> condizionientries = condizioni.map((String e) => DropdownMenuEntry<String>(value: e, label: e)).toList();

List<DropdownMenuItem<String>> ordini = [
  DropdownMenuItem(child: Text("Ordina"), value: "default",),
  DropdownMenuItem(child: Text("Value1"), value: "value1",),
  DropdownMenuItem(child: Text("Value2"), value: "value2",),
  DropdownMenuItem(child: Text("Value3"), value: "value3",),
];

List<CartaPokemon> listaRicerca = [
  CartaPokemon(idAnnuncio: counter++, carta: CartaTemplate(id: 1, nome: "Pikachu", edizione: "Edizione1", immagine: "pickachu_1.jpg", valore: 15), prezzo: 10.0, condizione: "Come nuovo"),
  CartaPokemon(idAnnuncio: counter++,carta: CartaTemplate(id: 9, nome: "Melmetal", edizione: "Edizione3", immagine: "melmetal.jpg", valore: 80), prezzo: 35.0, condizione: "Buono"),
  CartaPokemon(idAnnuncio: counter++,carta: CartaTemplate(id: 8, nome: "Axew", edizione: "Edizione1", immagine: "axew.jpg", valore: 10), prezzo: 10.0, condizione: "Accettabile"),
  CartaPokemon(idAnnuncio: counter++,carta: CartaTemplate(id: 2, nome: "Victini", edizione: "Edizione2", immagine: "victini.jpg", valore: 30), prezzo: 30.5, condizione: "Condizione4"),
];

List<CartaPokemon> consigliati = [
  CartaPokemon(idAnnuncio: counter++,carta: CartaTemplate(id: 1, nome: "Pikachu", edizione: "Edizione1", immagine: "pickachu_1.jpg", valore: 15), prezzo: 10.0, condizione: "Come nuovo"),
  CartaPokemon(idAnnuncio: counter++,carta: CartaTemplate(id: 9, nome: "Melmetal", edizione: "Edizione3", immagine: "melmetal.jpg", valore: 80), prezzo: 35.0, condizione: "Buono"),
  CartaPokemon(idAnnuncio: counter++,carta: CartaTemplate(id: 8, nome: "Axew", edizione: "Edizione1", immagine: "axew.jpg", valore: 10), prezzo: 10.0, condizione: "Accettabile"),
  CartaPokemon(idAnnuncio: counter++,carta: CartaTemplate(id: 2, nome: "Victini", edizione: "Edizione2", immagine: "victini.jpg", valore: 30), prezzo: 30.5, condizione: "Condizione4"),
];

List<CartaPokemon> visualizzati = [
  CartaPokemon(idAnnuncio: counter++,carta: CartaTemplate(id: 10, nome: "Mewtwo", edizione: "Edizione4", immagine: "mewtwo.jpg", valore: 120), prezzo: 80.0, condizione: "Decente"),
  CartaPokemon(idAnnuncio: counter++,carta: CartaTemplate(id: 11, nome: "Snorlax", edizione: "Edizione2", immagine: "snorlax.jpg", valore: 30), prezzo: 15.0, condizione: "Come nuovo"),
  CartaPokemon(idAnnuncio: counter++,carta: CartaTemplate(id: 12, nome: "Regirock", edizione: "Edizione1", immagine: "regirock.jpg", valore: 20), prezzo: 10.0, condizione: "Condizione3"),
  CartaPokemon(idAnnuncio: counter++,carta: CartaTemplate(id: 7, nome: "Groudon", edizione: "Edizione4", immagine: "groudon.jpg", valore: 150), prezzo: 30.5, condizione: "Condizione4"),
];

List<Chat> chatData = [
  Chat(offerente: "Infrizzi26", image: "assets/profiles/user1.jpg", isActive: true, lastMessage: "Ciao", time: "13:12", ricevente: 'Cuggio33', carteDesiderate: [
    CartaPokemon(idAnnuncio: counter++, carta: cartedb[7], condizione: "Buono", foto: ["groudon.jpg"]),
    CartaPokemon(idAnnuncio: counter++, carta: cartedb[2], condizione: "Buono", foto: ["victini.jpg"]),
  ]),
  Chat(ricevente: "Moscao13", image: "assets/profiles/user2.jpg", isActive: true, lastMessage: "Grazie!!", time: "1gg fa", offerente: 'Cuggio33', carteDesiderate: []),
  Chat(offerente: "Moscao13", image: "assets/profiles/user2.jpg", isActive: true, lastMessage: "Offerta", time: "1gg fa", ricevente: 'Cuggio33', carteDesiderate: []),
  Chat(ricevente: "Infrizzi26", image: "assets/profiles/user1.jpg", isActive: true, lastMessage: "10€?", time: "3gg fa", offerente: 'Cuggio33', carteDesiderate: []),
];

List<ChatMessage> messages = [
  ChatMessage(contenuto: ContenutoTesto(testo: "Ciao è possibile avere altre foto?"), isSender: false),
  ChatMessage(contenuto: ContenutoTesto(testo: "Ciao, certo!"), isSender: true),
  ChatMessage(contenuto: ContenutoImmagine(percorso: "assets/cards/groudon.jpg"), isSender: true, type: MessageType.imagine),
  ChatMessage(contenuto: ContenutoOfferta(offerta: Offerta(
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
  ),), isSender: false, type: MessageType.offerta),
];