import 'package:flutter/material.dart';
import 'package:poketrade/components/carta.dart';
import 'package:poketrade/components/offerta.dart';
import 'package:poketrade/components/tema.dart';

enum IndiceConvenienza {
  _moltoConveniente("Molto Conveniente", Colors.green),
  _conveniente("Conveniente", Colors.lightGreen),
  _equo("Equo", Colors.black),
  _sconveniente("Sconveniente", Colors.redAccent),
  _moltoSconveniente("Molto Sconveniente", Colors.red);

  final String value;
  final Color color;

  const IndiceConvenienza(this.value, this.color);

  static IndiceConvenienza? getIndiceDaValore(double valore) {
    if (valore < 0 || valore > 100) {
      print("Il valore con cui calcolare l'indice deve essere > 0 e < 100!");
      return null;
    }

    if (valore > 0 && valore < 15) {
      return IndiceConvenienza._moltoConveniente;
    } else if (valore < 40) {
      return IndiceConvenienza._conveniente;
    } else if (valore < 60) {
      return IndiceConvenienza._equo;
    } else if (valore < 85) {
      return IndiceConvenienza._sconveniente;
    } else {
      return IndiceConvenienza._moltoSconveniente;
    }
  }
}

class InfoOfferta extends StatelessWidget {
  final List<CartaPokemon> carteDesiderate;
  final Contropartita contropartita;
  final bool isOfferente;

  const InfoOfferta(
      {Key? key,
      required this.contropartita,
      required this.carteDesiderate,
      required this.isOfferente})
      : super(key: key);

  Widget _calcolaIndiceConvenienza() {
    double valoreRichiesta = 0;
    double valoreContropartita = 0;
    double valoreTotale = 0;

    for (var i = 0; i < carteDesiderate.length; i++) {
      valoreRichiesta += carteDesiderate[i].carta.valore;
      valoreTotale += carteDesiderate[i].carta.valore;
    }

    if (contropartita is ContropartitaScambio) {
      for (var i = 0; i < (contropartita as ContropartitaScambio).carteOfferte.length; i++) {
        valoreContropartita += (contropartita as ContropartitaScambio).carteOfferte[i].carta.valore;
        valoreTotale += (contropartita as ContropartitaScambio).carteOfferte[i].carta.valore;
      }
    } else {
      valoreContropartita = (contropartita as ContropartitaAcquisto).importoOfferto;
      valoreTotale = (contropartita as ContropartitaAcquisto).importoOfferto;
    }

    double valore;

    if (isOfferente) {
      valore = (valoreRichiesta * 100) / valoreTotale;
    } else {
      valore = (valoreContropartita * 100) / valoreTotale;
    }

    IndiceConvenienza indice = IndiceConvenienza.getIndiceDaValore(valore)!;
    return Text( indice.value, style: TextStyle(color: indice.color), textAlign: TextAlign.center,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
        backgroundColor: PokeTradePrimaryColor,
        foregroundColor: PokeTradeSecondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Offerta",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                ),
                contropartita is ContropartitaScambio
                    ? GestureDetector(
                        onTap: () {
                          showDialog<String>(
                              context: context,
                              builder: (context) => Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: _calcolaIndiceConvenienza(),
                                    ),
                                  ));
                        },
                        child: const Text(
                          "Visualizza indice di convenienza",
                          style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Le tue carte:",
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 10,
            ),
            isOfferente
                ? InfoCarte(
                    carte: (contropartita as ContropartitaScambio).carteOfferte)
                : InfoCarte(carte: carteDesiderate),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Le sue carte:",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            isOfferente
                ? InfoCarte(carte: carteDesiderate)
                : InfoCarte(
                    carte:
                        (contropartita as ContropartitaScambio).carteOfferte),
          ],
        ),
      ),
    );
  }
}

class InfoCarte extends StatelessWidget {
  final List<CartaPokemon> carte;

  const InfoCarte({Key? key, required this.carte}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < carte.length; i++)
            Container(
                padding: EdgeInsets.only(right: 10),
                child: Image.asset("assets/cards/${carte[i].carta.immagine}")),
        ],
      ),
    );
  }
}

class InfoImporto extends StatelessWidget {
  const InfoImporto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
