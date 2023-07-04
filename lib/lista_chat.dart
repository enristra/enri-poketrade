import 'package:flutter/material.dart';
import 'package:poketrade/components/tema.dart';
import 'package:poketrade/fake_database/database.dart';
import 'package:poketrade/vista_chat.dart';
import 'package:poketrade/chat.dart';

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
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 5),
                  physics: const BouncingScrollPhysics(),
                    itemCount: chatData.length,
                    itemBuilder: (context, index) => ChatCard(
                      chat: chatData[index],
                      tap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(chat: chatData[index], username: username,))),
                      username: username,
                    )
                )
            )
          ],
        ),
      ),
      ],
    );
  }
}
