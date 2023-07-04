import "package:flutter/material.dart";
import "package:poketrade/components/chat_message.dart";
import "package:poketrade/components/offerta.dart";
import "package:poketrade/components/tema.dart";
import "package:poketrade/info_offerta.dart";

class Message extends StatelessWidget {
  final ChatMessage message;
  final String username;

  const Message({Key? key, required this.message, required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget createMessaggio(ChatMessage message) {
      switch (message.type) {
        case MessageType.testo:
          return TextMessage(
              content: (message.contenuto as ContenutoTesto).testo);
        case MessageType.imagine:
          return ImageMessage(
              path: (message.contenuto as ContenutoImmagine).percorso);
        case MessageType.offerta:
          return OffertaMessage(
              offerta: (message.contenuto as ContenutoOfferta).offerta,
              isOfferente: username ==
                  (message.contenuto as ContenutoOfferta).offerta.offerente);
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
            constraints: const BoxConstraints(maxWidth: 250),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              color: message.isSender ? PokeTradePrimaryColor : Colors.white,
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
  final Offerta offerta;
  final bool isOfferente;

  const OffertaMessage(
      {Key? key, required this.offerta, required this.isOfferente})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: const Text("Ciao, ecco la mia offerta:")),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (var i = 0;
                    i <
                        (offerta.contropartita as ContropartitaScambio)
                            .carteOfferte
                            .length;
                    i++)
                  Container(
                    padding: const EdgeInsets.only(right: 5),
                    child: Image.asset(
                      "assets/cards/${(offerta.contropartita as ContropartitaScambio).carteOfferte[i].carta.immagine}",
                      scale: 3,
                    ),
                  ),
              ],
            ),
          ),
        ),
        isOfferente
            ? ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  backgroundColor: Colors.transparent,
                  foregroundColor: PokeTradeSecondaryColor,
                  shape: const BeveledRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1)),
                ),
                icon: const Icon(
                  Icons.menu,
                  size: 15,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoOfferta(
                            isOfferente: isOfferente,
                            contropartita: offerta.contropartita,
                            carteDesiderate: offerta.carteDesiderate),
                      ));
                },
                label: const Text("Info", style: TextStyle(fontSize: 12)),
              )
            : Row(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      backgroundColor: Colors.transparent,
                      foregroundColor: PokeTradeSecondaryColor,
                      shape: const BeveledRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1)),
                    ),
                    icon: const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 15,
                    ),
                    onPressed: () {
                      offerta.accettaOfferta();
                    },
                    label:
                        const Text("Accetta", style: TextStyle(fontSize: 12)),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      backgroundColor: Colors.transparent,
                      foregroundColor: PokeTradeSecondaryColor,
                      shape: const BeveledRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1)),
                    ),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 15,
                    ),
                    onPressed: () {
                      offerta.rifiutaOfferta();
                    },
                    label:
                        const Text("Rifiuta", style: TextStyle(fontSize: 12)),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      backgroundColor: Colors.transparent,
                      foregroundColor: PokeTradeSecondaryColor,
                      shape: const BeveledRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1)),
                    ),
                    icon: const Icon(
                      Icons.menu,
                      size: 15,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfoOfferta(
                                isOfferente: isOfferente,
                                contropartita: offerta.contropartita,
                                carteDesiderate: offerta.carteDesiderate),
                          ));
                    },
                    label: const Text("Info", style: TextStyle(fontSize: 12)),
                  ),
                ],
              )
      ],
    );
  }
}
