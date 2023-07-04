import 'package:flutter/material.dart';
import 'package:poketrade/components/carta.dart';
import 'package:poketrade/components/carta_template.dart';
import 'package:poketrade/components/tema.dart';
import 'package:poketrade/fake_database/database.dart';
import 'package:poketrade/providers/area_carte_provider.dart';
import 'package:provider/provider.dart';

class AggiuntaCarta extends StatefulWidget {
  final String username;

  AggiuntaCarta({Key? key, required this.username}) : super(key: key);

  @override
  State<AggiuntaCarta> createState() => _AggiuntaCartaState();
}

class _AggiuntaCartaState extends State<AggiuntaCarta> {

  CartaTemplate? cartaScelta;
  String? condizioneScelta;
  double? prezzoFissato;

  aggiungiCarta(BuildContext context){
    if(cartaScelta == null || condizioneScelta == null || prezzoFissato == null){
      return null;
    }

    CartaPokemon result = CartaPokemon(
        idAnnuncio: counter ++,
        carta: cartaScelta!,
        prezzo: prezzoFissato!,
        condizione: condizioneScelta!
    );

    context.read<AreaCarteProvider>().aggiungiCarta(result, widget.username);
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aggiungi Carta"),
        backgroundColor: PokeTradePrimaryColor,
        foregroundColor: PokeTradeSecondaryColor,
      ),

      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text("Seleziona la carta da aggiungere:"),
            DropdownMenu<CartaTemplate>(
              dropdownMenuEntries: cartedbentries,
              onSelected: (value) => setState(() {
                cartaScelta = value!;
              }),
            ),
            const Text("Seleziona la condizione della carta:"),
            DropdownMenu<String>(
              dropdownMenuEntries: condizionientries,
              onSelected: (value) => setState(() {
                condizioneScelta = value!;
              }),
            ),
            const Text("Seleziona il prezzo della carta:"),
            SizedBox(
              width: 100,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  double result;
                  try{
                    result = double.parse(value);
                  }catch(e){
                    return;
                  }

                  setState(() {
                    prezzoFissato = result;
                  });
                },
                decoration: const InputDecoration(
                  hintText: "prezzo",
                  suffixIcon: Icon(
                    Icons.euro,
                    size: 20,
                  ),
                ),
              ),
            ),

            ElevatedButton(
                onPressed: (){aggiungiCarta(context);},
                child: Text("Aggiungi"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: PokeTradePrimaryColor,
                  foregroundColor: PokeTradeSecondaryColor,
                ),
            )
          ],
        ),
      ),

    );
  }
}
