import "package:flutter/material.dart";
import "package:poketrade/carta.dart";
import "package:poketrade/components/tema.dart";
import "package:poketrade/fake_database/database.dart";
import "package:poketrade/filter.dart";

class Ricerca extends StatefulWidget {
  final String username;
  const Ricerca({Key? key, required this.username}) : super(key: key);

  @override
  State<Ricerca> createState() => _RicercaState();
}

class _RicercaState extends State<Ricerca> {
  String _ordine = "default";
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
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 50)),
              Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: const DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 30,
                      color: PokeTradeSecondaryColor,
                      fontWeight: FontWeight.bold),
                  child: Text(
                    "Ricerca",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                      decoration: InputDecoration(
                          enabled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: PokeTradeSecondaryColor, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: PokeTradeSecondaryColor, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: PokeTradeSecondaryColor,
                            size: 30,
                          ),
                          hintText: "Cerca...",
                          fillColor: Colors.transparent,
                          filled: true))),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    padding: const EdgeInsets.only(left: 20),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.arrow_drop_down),
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        foregroundColor: PokeTradeSecondaryColor,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.black, width: 1), borderRadius: BorderRadius.circular(5))// Background color
                      ),
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Filters()));},
                        label: const Text("Filtra"),
                    ),
                  ),
                  Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 20),
                    child: DropdownButton<String>(
                      items: ordini,
                      hint: const Text("Ordina"),
                      value: _ordine,
                      onChanged: (value){
                        setState(() {
                          _ordine = value!;
                        });
                      },
                      icon: const Icon(Icons.compare_arrows),
                    ),
                  ),
                ],

              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.only(top: 10),
                  physics: const BouncingScrollPhysics(),
                    childAspectRatio: (150/240),
                    crossAxisCount: 2,
                    children: [
                      for(var i = 0; i < listaRicerca.length; i++)
                        Carta(carta: listaRicerca[i])
                    ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
