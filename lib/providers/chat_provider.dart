import 'package:flutter/material.dart';
import 'package:poketrade/components/carta.dart';
import 'package:poketrade/components/chat.dart';
import 'package:poketrade/components/chat_message.dart';
import 'package:poketrade/components/offerta.dart';
import 'package:poketrade/fake_database/database.dart';

class ChatProvider with ChangeNotifier{
  List<Chat> chatData = [
    Chat(offerente: "Infrizzi26", image: "assets/profiles/user1.jpg", isActive: true, lastMessage: "Ciao", time: "3gg fa", ricevente: 'Cuggio33', carteDesiderate: [
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[7], condizione: "Buono", foto: ["groudon.jpg"]),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[2], condizione: "Buono", foto: ["victini.jpg"]),
    ], messagi: messages1),

    Chat(ricevente: "Moscao13", image: "assets/profiles/user2.jpg", isActive: true, lastMessage: "Grazie!!", time: "1gg fa", offerente: 'Cuggio33', carteDesiderate: []),
    Chat(offerente: "Moscao13", image: "assets/profiles/user2.jpg", isActive: true, lastMessage: "Offerta", time: "1gg fa", ricevente: 'Cuggio33', carteDesiderate: []),
    Chat(ricevente: "Infrizzi26", image: "assets/profiles/user1.jpg", isActive: true, lastMessage: "10€?", time: "13:12", offerente: 'Cuggio33', carteDesiderate: [
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[7], condizione: "Buono", foto: ["groudon.jpg"], prezzo: 10),
      CartaPokemon(idAnnuncio: counter++, carta: cartedb[2], condizione: "Buono", foto: ["victini.jpg"], prezzo: 37),
    ], messagi: messages2),
  ];

  bool _checkCarteDesiderate(List<CartaPokemon> list, Chat chat){
    bool isPresent = false;
    for(CartaPokemon carta in chat.carteDesiderate){
      isPresent = false;
      for(CartaPokemon cartaInList in list){
        if(carta == cartaInList){
          isPresent =true;
        }
      }
      if(!isPresent){
        return false;
      }
    }

    for(CartaPokemon cartaInList in list){
      isPresent = false;
      for(CartaPokemon carta in chat.carteDesiderate){
        if(carta == cartaInList){
          isPresent =true;
        }
      }
      if(!isPresent){
        return false;
      }
    }
    return true;
  }

  inviaOfferta(Offerta offerta){
    for(Chat c in  chatData){
      if(c.offerente == offerta.offerente && c.ricevente == offerta.ricevente && _checkCarteDesiderate(offerta.carteDesiderate, c)){
        c.messagi.add(ChatMessage(contenuto: ContenutoOfferta(offerta: offerta), type: MessageType.offerta, isSender: true));
        c.lastMessage = "Offerta";
        return;
      }
    }

    chatData.add(Chat(image: 'assets/profiles/user1.jpg', isActive: true, lastMessage: 'Offerta', offerente: offerta.offerente, time: 'ora', ricevente: offerta.ricevente, carteDesiderate: offerta.carteDesiderate, messagi: [ChatMessage(contenuto: ContenutoOfferta(offerta: offerta), type: MessageType.offerta, isSender: true)]));
  }


}