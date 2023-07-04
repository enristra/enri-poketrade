import 'package:flutter/material.dart';
import 'package:poketrade/carta.dart';
import 'package:poketrade/components/tema.dart';
import 'package:poketrade/fake_database/database.dart';

class Home extends StatefulWidget {
  final String username;
  const Home({Key? key, required this.username}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: const Text("Benvenuto"),
            titleTextStyle: const TextStyle(
                fontSize: 30,
                color: PokeTradeSecondaryColor,
                fontWeight: FontWeight.bold),
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DefaultTextStyle(
                        style: TextStyle(fontSize: 20, color: PokeTradeSecondaryColor, fontWeight: FontWeight.bold),
                        child: Text(
                          "Consigliati",
                        ),
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
                        child: Text(
                          "Vedi tutti",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 300,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
                          physics: const BouncingScrollPhysics(),
                          children: [
                            for (var i = 0; i < 4; i++)
                              Carta(carta: consigliati[i]),
                          ])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DefaultTextStyle(
                        style: TextStyle(fontSize: 20, color: PokeTradeSecondaryColor, fontWeight: FontWeight.bold),
                        child: Text(
                          "Visualizzati di recente",
                        ),
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
                        child: Text(
                          "Vedi tutti",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 300,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(top: 8, right: 8),
                          physics: const BouncingScrollPhysics(),
                          children: [
                            for (var i = 0; i < 4; i++)
                              Carta(carta: visualizzati[i]),
                          ])),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
