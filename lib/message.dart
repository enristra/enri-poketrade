import "package:flutter/material.dart";
import "package:poketrade/components/chat_message.dart";

class Message extends StatelessWidget {
  final ChatMessage message;

  const Message({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget createMessaggio(ChatMessage message) {
      switch (message.type) {
        case MessageType.testo:
          return TextMessage(content: message.text);
        case MessageType.imagine:
          return ImageMessage(path: message.text);
        case MessageType.offerta:
          return const OffertaMessage();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            const CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage("assets/profiles/default.jpg"),
            )
          ],
          const SizedBox(width: 5),
          Container(
            constraints: const BoxConstraints(maxWidth: 200),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              color: message.isSender
                  ? const Color.fromARGB(255, 255, 168, 168)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: createMessaggio(message),
          ),
          const SizedBox(width: 5),
          if (message.isSender) ...[
            const CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage("assets/profiles/default.jpg"),
            )
          ],
        ],
      ),
    );
  }
}

class TextMessage extends StatelessWidget {
  final String content;

  const TextMessage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(content);
  }
}

class ImageMessage extends StatelessWidget {
  final String path;

  const ImageMessage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(path);
  }
}

class OffertaMessage extends StatelessWidget {
  const OffertaMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Ciao, ecco la mia offerta:"),
        const SizedBox(height: 4,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.asset("assets/cards/axew.jpg", scale: 3,),
              const SizedBox(width: 4,),
              Image.asset("assets/cards/pickachu_1.jpg", scale: 3,),
              const SizedBox(width: 4,),
              Image.asset("assets/cards/groudon.jpg", scale: 3,),
              const SizedBox(width: 4,),
              Image.asset("assets/cards/groudon.jpg", scale: 3,),
            ],
          ),
        ),
        Row(
          children: const [
            Text("Accetta", style: TextStyle(fontSize: 12)),
            Icon(
              Icons.check,
              color: Colors.green,
            ),
            Text("Rifiuta", style: TextStyle(fontSize: 12)),
            Icon(
              Icons.close,
              color: Colors.red,
            ),
            Text("Info", style: TextStyle(fontSize: 12)),
            Icon(Icons.menu),
          ],
        )
      ],
    );
  }
}
