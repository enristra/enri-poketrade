import "package:flutter/material.dart";
import "package:poketrade/components/chat.dart";
class ChatCard extends StatelessWidget {
  final String username;
  const ChatCard({Key? key, required this.chat, required this.tap, required this.username}) : super(key: key);

  final Chat chat;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(chat.image),
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chat.offerente == username ? chat.ricevente : chat.offerente, style: const TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 8),
                    Text(chat.lastMessage, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ]
              ),
            )),
            Text(chat.time),
          ],
        ),
      ),
    );
  }
}