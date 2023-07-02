import 'package:flutter/material.dart';
import 'package:poketrade/components/carta.dart';
class Carta extends StatelessWidget {
  final CartaPokemon carta;
  const Carta({Key? key, required this.carta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog<String>(
          context: context,
          builder: (context) => Dialog.fullscreen(
            backgroundColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/cards/${carta.image}"),
                  //Text(carta.condizione, style: TextStyle(color: Colors.white),),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
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
            Image.asset("assets/cards/${carta.image}", height: 240),
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
                  Image.asset("assets/profiles/${carta.profilo}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
