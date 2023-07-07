import 'package:flutter/material.dart';
import 'package:poketrade/components/chat.dart';
import 'package:poketrade/components/tema.dart';
import 'package:poketrade/providers/chat_provider.dart';
import 'package:poketrade/vista_chat.dart';
import 'package:poketrade/chat.dart';
import 'package:provider/provider.dart';

class ListaChat extends StatelessWidget {
  final String username;
  const ListaChat({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.fill
              )
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: const Text("Area Chat"),
            titleTextStyle: const TextStyle(
                fontSize: 30,
                color: PokeTradeSecondaryColor,
                fontWeight: FontWeight.bold),
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 5),
                  children: [
                    for(Chat chat in context.watch<ChatProvider>().chatData.reversed)
                      ChatCard(
                        chat: chat,
                        tap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(chat: chat, username: username,))),
                        username: username,
                      ),
                  ],
                )
            )
          ],
        ),
      ),
      ],
    );
  }
}
