import 'package:poketrade/components/offerta.dart';

class ChatMessage{
  late Contenuto contenuto;
  late bool isSender;
  late MessageType type;

  ChatMessage({required this.contenuto, required this.isSender, this.type=MessageType.testo});
}

enum MessageType{
  testo,
  imagine,
  offerta
}

class Contenuto{

}

class ContenutoTesto extends Contenuto{
  late String testo;

  ContenutoTesto({required this.testo});
}

class ContenutoImmagine extends Contenuto{
  late String percorso;

  ContenutoImmagine({required this.percorso});
}

class ContenutoOfferta extends Contenuto{
  late Offerta offerta;

  ContenutoOfferta({required this.offerta});
}