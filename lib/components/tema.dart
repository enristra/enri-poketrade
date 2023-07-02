import 'package:flutter/material.dart';
import 'package:poketrade/components/carta.dart';
import 'package:poketrade/components/chat.dart';
import 'package:poketrade/components/chat_message.dart';
import 'package:poketrade/components/checkbox_item.dart';

const PokeTradePrimaryColor = Color.fromARGB(255, 255, 128, 128);
const PokeTradeSecondaryColor = Colors.black;

List<CheckBoxItem> edizioniCarte = [
  CheckBoxItem<String>(value: CheckBoxItemObject<String>(value: "Edizione1")),
  CheckBoxItem<String>(value: CheckBoxItemObject<String>(value: "Edizione2")),
  CheckBoxItem<String>(value: CheckBoxItemObject<String>(value: "Edizione3")),
  CheckBoxItem<String>(value: CheckBoxItemObject<String>(value: "Edizione4")),
  CheckBoxItem<String>(value: CheckBoxItemObject<String>(value: "Edizione5")),
  CheckBoxItem<String>(value: CheckBoxItemObject<String>(value: "Edizione6")),
  CheckBoxItem<String>(value: CheckBoxItemObject<String>(value: "Edizione7")),
];

List<CheckBoxItem> condizioniCarte = [
  CheckBoxItem<String>(value: CheckBoxItemObject<String>(value: "Condizione1")),
  CheckBoxItem<String>(value: CheckBoxItemObject<String>(value: "Condizione2")),
  CheckBoxItem<String>(value: CheckBoxItemObject<String>(value: "Condizione3")),
  CheckBoxItem<String>(value: CheckBoxItemObject<String>(value: "Condizione4")),
];
List<DropdownMenuItem<String>> ordini = [
  DropdownMenuItem(child: Text("Ordina"), value: "default",),
  DropdownMenuItem(child: Text("Value1"), value: "value1",),
  DropdownMenuItem(child: Text("Value2"), value: "value2",),
  DropdownMenuItem(child: Text("Value3"), value: "value3",),
];

List<CartaPokemon> listaRicerca = [
  CartaPokemon(nome: "pickachu",edizione: "Edizione1", prezzo: 10.0, image: "pickachu_1.jpg", condizione: "Come nuovo"),
  CartaPokemon(nome: "melmetal",edizione: "Edizione1", prezzo: 35.0, image: "melmetal.jpg", condizione: "Buono"),
  CartaPokemon(nome: "axew",edizione: "Edizione1", prezzo: 10.0, image: "axew.jpg", condizione: "Accettabile"),
  CartaPokemon(nome: "victini",edizione: "Edizione1", prezzo: 30.5, image: "victini.jpg", condizione: "Condizione4"),
];

List<CartaPokemon> consigliati = [
  CartaPokemon(nome: "pickachu",edizione: "Edizione1", prezzo: 10.0, image: "pickachu_1.jpg", condizione: "Come nuovo"),
  CartaPokemon(nome: "melmetal",edizione: "Edizione1", prezzo: 35.0, image: "melmetal.jpg", condizione: "Buono"),
  CartaPokemon(nome: "axew",edizione: "Edizione1", prezzo: 10.0, image: "axew.jpg", condizione: "Accettabile"),
  CartaPokemon(nome: "victini",edizione: "Edizione1", prezzo: 30.5, image: "victini.jpg", condizione: "Condizione4"),
];

List<CartaPokemon> visualizzati = [
  CartaPokemon(nome: "mewtwo",edizione: "Edizione1", prezzo: 80.0, image: "mewtwo.jpg", condizione: "Decente"),
  CartaPokemon(nome: "snorlax",edizione: "Edizione1", prezzo: 15.0, image: "snorlax.jpg", condizione: "Come nuovo"),
  CartaPokemon(nome: "regirock",edizione: "Edizione1", prezzo: 10.0, image: "regirock.jpg", condizione: "Condizione3"),
  CartaPokemon(nome: "groudon",edizione: "Edizione1", prezzo: 30.5, image: "groudon.jpg", condizione: "Condizione4"),
];

List<Chat> chatData = [
  Chat(name: "MarioRossi420", image: "assets/profiles/user1.jpg", isActive: true, lastMessage: "Ciao", time: "13:12"),
  Chat(name: "LucaPaladino", image: "assets/profiles/user2.jpg", isActive: true, lastMessage: "Grazie!!", time: "1gg fa"),
  Chat(name: "EnricoStrangio", image: "assets/profiles/user3.jpg", isActive: true, lastMessage: "Offerta", time: "1gg fa"),
  Chat(name: "MattiaMosconi", image: "assets/profiles/user4.jpg", isActive: true, lastMessage: "10€?", time: "3gg fa"),
  Chat(name: "LucaGialli", image: "assets/profiles/user1.jpg", isActive: true, lastMessage: "Ciao sono interessato", time: "4gg fa"),
  Chat(name: "GiovanniVerdi", image: "assets/profiles/user2.jpg", isActive: true, lastMessage: "è possibile avere altre foto?", time: "4gg fa"),
  Chat(name: "AlessandroBianchi", image: "assets/profiles/user3.jpg", isActive: true, lastMessage: "Ciao", time: "1sett fa"),
  Chat(name: "MarioRossi420", image: "assets/profiles/user4.jpg", isActive: true, lastMessage: "Ciao", time: "1sett fa"),
  Chat(name: "MarioRossi420", image: "assets/profiles/user1.jpg", isActive: true, lastMessage: "Ciao", time: "13:12"),
  Chat(name: "MarioRossi420", image: "assets/profiles/user2.jpg", isActive: true, lastMessage: "Ciao", time: "13:12"),
  Chat(name: "MarioRossi420", image: "assets/profiles/user3.jpg", isActive: true, lastMessage: "Ciao", time: "13:12"),
  Chat(name: "MarioRossi420", image: "assets/profiles/default.jpg", isActive: true, lastMessage: "Ciao", time: "13:12"),
  Chat(name: "MarioRossi420", image: "assets/profiles/default.jpg", isActive: true, lastMessage: "Ciao", time: "13:12"),
  Chat(name: "MarioRossi420", image: "assets/profiles/default.jpg", isActive: true, lastMessage: "Ciao", time: "13:12"),
  Chat(name: "MarioRossi420", image: "assets/profiles/default.jpg", isActive: true, lastMessage: "Ciao", time: "13:12"),
];

List<ChatMessage> messages = [
  ChatMessage(text: "Ciao è possibile avere altre foto?", isSender: false),
  ChatMessage(text: "Ciao, certo!", isSender: true),
  ChatMessage(text: "assets/cards/groudon.jpg", isSender: true, type: MessageType.imagine),
  ChatMessage(text: "Ciao è ancora in vendita?", isSender: false, type: MessageType.offerta),
];