import 'package:flutter/material.dart';
import 'package:poketrade/components/tema.dart';
class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PokeTradePrimaryColor,
        title: const Text("Account"),
      ),
      body: Container(
        height: 406,
        width: 300,
        child: Column(
          children: [
            Image.asset("assets/images/pickachu_bricklayer.jpg"),
            Text("Work in progress...")
          ],
        ),
      ),
    );
  }
}
