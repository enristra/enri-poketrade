import 'package:flutter/material.dart';
import 'package:poketrade/carta.dart';
import 'package:poketrade/components/carta.dart';
import 'package:poketrade/components/offerta.dart';
import 'package:poketrade/components/radiobutton_item.dart';
import 'package:poketrade/components/tema.dart';
import 'package:poketrade/components/checkbox_item.dart';
import 'package:poketrade/fake_database/database.dart';
import 'package:poketrade/providers/area_carte_provider.dart';
import 'package:poketrade/providers/chat_provider.dart';
import 'package:poketrade/providers/offerte_provider.dart';
import 'package:provider/provider.dart';

class InvioOfferta extends StatefulWidget {
  final List<CartaPokemon> carteDesiderate;
  final String username;
  final String offerente;
  const InvioOfferta({Key? key, required this.carteDesiderate, required this.username, required this.offerente}) : super(key: key);

  @override
  State<InvioOfferta> createState() => _InvioOffertaState();
}

class _InvioOffertaState extends State<InvioOfferta> {
  String tipoOfferta = "Acquisto";
  double? importo;
  List<CartaPokemon>? carteOfferte;
  List<CheckBoxItemObject<CartaPokemon>>? miaAreaCarte;

  invioOfferta(BuildContext context){
    if((tipoOfferta == "Acquisto" && importo == null) || (tipoOfferta == "Scambio" && carteOfferte == null)){
      return;
    }
    Contropartita contropartita;
    if(tipoOfferta == "Acquisto"){
      contropartita = ContropartitaAcquisto(importoOfferto: importo!);
    }else{
      contropartita = ContropartitaScambio(carteOfferte: carteOfferte!);
    }

    Offerta offerta = Offerta(offerente: widget.offerente, ricevente: widget.username, carteDesiderate: widget.carteDesiderate, contropartita: contropartita);
    context.read<OfferteProvider>().offerte.add(offerta);
    context.read<ChatProvider>().inviaOfferta(offerta);
    Navigator.pop(context);
  }

  fillAreaCarte(){
    if(miaAreaCarte == null){
      setState(() {
        miaAreaCarte = context.watch<AreaCarteProvider>().getUtenteByUsername(widget.offerente)!.areaCarte.map((e) => CheckBoxItemObject<CartaPokemon>(value: e, label: "${e.carta.nome} ${e.carta.edizione}")).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    fillAreaCarte();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PokeTradePrimaryColor,
        title: const Text("Invio Offerta"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
              alignment: Alignment.centerLeft,
                child: const Text("Carte desiderate:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),)
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(CartaPokemon c in widget.carteDesiderate)
                      Carta(carta: c, username: widget.username, popup: true),
                  ],
                ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text("Tipo offerta:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),)
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30.0, vertical: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tipiOfferta.length,
              itemBuilder: (context, index) => RadioButtonItem(value: RadioButtonObject<String>(value: tipiOfferta[index], groupValue: tipoOfferta),
                onChanged: (value) {
                setState(() {
                  tipoOfferta = value!;
                });
              },),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(tipoOfferta == "Acquisto" ? "Inserisci importo" : "Seleziona le carte", style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),)
            ),
            tipoOfferta == "Acquisto" ? SizedBox(
              width: 100,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlignVertical: TextAlignVertical.center,
                onSubmitted: (value) => setState(() {
                  try{
                    importo = double.parse(value);
                  }catch(e){
                    return;
                  }
                }),
                decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.euro,
                      size: 20,
                    )),
              ),
            )
            : Column(
              children: [
                for(var i = 0; i < miaAreaCarte!.length; i++)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(miaAreaCarte![i].label),
                        Checkbox(value: miaAreaCarte![i].checked, onChanged: (newValue){
                          setState(() {
                          miaAreaCarte![i].checked = !miaAreaCarte![i].checked;
                          carteOfferte ??= [];
                          if (carteOfferte!.contains(miaAreaCarte![i].value)) {
                            carteOfferte!.remove(miaAreaCarte![i].value);
                          } else {
                            carteOfferte!.add(miaAreaCarte![i].value);
                          }
                        });
                        }
                        ),
                      ],
                    ),
                  ),

              ],
            ),
            ElevatedButton(onPressed: ((tipoOfferta == "Acquisto" && importo != null) || (tipoOfferta == "Scambio" && carteOfferte != null && carteOfferte!.isNotEmpty)) ? () => invioOfferta(context) : null,
              style: ElevatedButton.styleFrom(
              backgroundColor: PokeTradePrimaryColor,
            ),
              child: const Text("Invia"),
            ),
          ],
        ),
      ),
    );
  }
}
