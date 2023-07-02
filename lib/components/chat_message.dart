class ChatMessage{
  late String text;
  late bool isSender;
  late MessageType type;

  ChatMessage({required this.text, required this.isSender, this.type=MessageType.testo});
}

enum MessageType{
  testo,
  imagine,
  offerta
}