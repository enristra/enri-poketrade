import 'package:flutter/material.dart';
import 'package:poketrade/components/carta.dart';
class Carta extends StatelessWidget {
  final CartaPokemon carta;
  final bool popup;
  const Carta({Key? key, required this.carta, this.popup=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !popup ? null : () => showDialog<String>(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: const Color.fromRGBO(232, 227, 227, 95),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Text(carta.carta.nome, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),),
                      const SizedBox(width: 10,),
                      Text(carta.carta.edizione,),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Image.asset("assets/cards/${carta.carta.immagine}"),
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      const Text("Prezzo: ", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                      Text("${carta.prezzo} €"),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Condizione: ", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                      Text(carta.condizione),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Chiudi'),
                  ),
                ],
              ),
            ),
          ),
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/cards/${carta.carta.immagine}", height: 240),
            Container(
              padding: const EdgeInsets.only(right: 5, left: 5),
              width: 157,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${carta.prezzo} €", style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text(carta.condizione),
                    ],
                  ),
                  Image.asset("assets/profiles/${carta.proprietario}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
