import 'package:flutter/material.dart';
import 'package:poketrade/area_carte.dart';
import 'package:poketrade/components/carta.dart';
class Carta extends StatefulWidget {
  final CartaPokemon carta;
  final bool popup;
  final String username;
  final Function()? onLongPress;
  const Carta({Key? key, required this.carta, this.popup=false, required this.username, this.onLongPress}) : super(key: key);

  @override
  State<Carta> createState() => _CartaState();
}

class _CartaState extends State<Carta> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: widget.onLongPress,
      onTap: !widget.popup ? (){Navigator.push(context, MaterialPageRoute(builder: (context) => AreaCarte(username: "Infrizzi26", offerente: widget.username,),));} : () => showDialog<String>(
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
                      Text(widget.carta.carta.nome, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 30),),
                      const SizedBox(width: 10,),
                      Text(widget.carta.carta.edizione,),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Image.asset("assets/cards/${widget.carta.carta.immagine}"),
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      const Text("Prezzo: ", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                      Text("${widget.carta.prezzo} €"),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Condizione: ", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                      Text(widget.carta.condizione),
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
        shape: selected ? const BeveledRectangleBorder(side: BorderSide(color: Colors.green, width: 5)) : const BeveledRectangleBorder(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/cards/${widget.carta.carta.immagine}", height: 240),
            Container(
              padding: const EdgeInsets.only(right: 5, left: 5),
              width: 157,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.carta.prezzo!.toStringAsFixed(2)} €", style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text(widget.carta.condizione),
                    ],
                  ),
                  Image.asset("assets/profiles/${widget.carta.proprietario}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
