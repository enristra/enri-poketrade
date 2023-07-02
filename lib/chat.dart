import "package:flutter/material.dart";
import "package:poketrade/components/chat.dart";
import "package:poketrade/components/tema.dart";
import "package:poketrade/message.dart";

class ChatScreen extends StatelessWidget {
  final Chat chat;

  const ChatScreen({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          //margin: EdgeInsets.only(top: 36),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/chat_background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: PokeTradePrimaryColor,
            foregroundColor: PokeTradeSecondaryColor,
            leadingWidth: 90,
            leading: Row(
             children: [
               IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () {Navigator.pop(context);}),
               CircleAvatar(
                 backgroundImage: AssetImage(chat.image),
               ),
             ],
            ),
            title: Text(chat.name),
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset("assets/cards/mewtwo.jpg", scale: 4,),
                    const SizedBox(width: 4,),
                    Image.asset("assets/cards/melmetal.jpg", scale: 4,),
                    const SizedBox(width: 4,),
                    Image.asset("assets/cards/snorlax.jpg", scale: 4,),
                    const SizedBox(width: 4,),
                    Image.asset("assets/cards/groudon.jpg", scale: 4,),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) =>
                          Message(message: messages[index]),
                    )),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: SafeArea(
                    child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: PokeTradePrimaryColor, width: 2), borderRadius: BorderRadius.circular(10)),
                                    suffixIcon: const Icon(Icons.image_outlined, color: PokeTradeSecondaryColor, size: 30,),
                                      hintText: "Scrivi...",
                                      fillColor: Colors.white,
                                      filled: true))),
                          const SizedBox(width: 10,),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: PokeTradePrimaryColor,
                              borderRadius: BorderRadius.circular(50)
                            ),
                              child: const Icon(Icons.send_outlined)
                          ),
                        ],
                      ),
                    ))
                  ],
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
