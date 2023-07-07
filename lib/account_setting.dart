import 'package:flutter/material.dart';
import 'package:poketrade/components/tema.dart';
class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/pickachu_bricklayer.jpg"),
                  fit: BoxFit.scaleDown,
              )
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: PokeTradePrimaryColor,
            title: const Text("Account"),
          ),
          body: const Text("Work in progress..."),
        ),
      ],
    );
  }
}
