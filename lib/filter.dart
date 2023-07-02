import 'package:flutter/material.dart';
import 'package:poketrade/components/tema.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  int startValue = 10;
  int endValue = 20;
  double rangeMin = 0;
  double rangeMax = 50;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          //margin: EdgeInsets.only(top: 36),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: const Text("Filtri"),
            titleTextStyle: const TextStyle(
                fontSize: 30,
                color: PokeTradeSecondaryColor,
                fontWeight: FontWeight.bold),
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: const DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 20,
                        color: PokeTradeSecondaryColor,
                        fontWeight: FontWeight.w500),
                    child: Text(
                      "Prezzo",
                    ),
                  ),
                ),
                RangeSlider(
                  values: RangeValues(startValue.toDouble(), endValue.toDouble()),
                  activeColor: PokeTradePrimaryColor,
                  inactiveColor: PokeTradeSecondaryColor.withOpacity(0.2),
                  onChanged: (value) {
                    setState(() {
                      startValue = value.start.floor();
                      endValue = value.end.floor();
                    });
                  },
                  max: rangeMax,
                  min: rangeMin,
                  divisions: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlignVertical: TextAlignVertical.center,
                          onSubmitted: (value) => setState(() {
                            int intValue;
                            try{
                              intValue = int.parse(value);
                            }catch(e){
                              return;
                            }
                            if (intValue < rangeMin || intValue > rangeMax) {
                              return;
                            }
                            startValue = intValue;
                          }),
                          decoration: InputDecoration(
                              hintText: "$startValue",
                              suffixIcon: const Icon(
                                Icons.euro,
                                size: 20,
                              ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlignVertical: TextAlignVertical.center,
                          onSubmitted: (value) => setState(() {
                            int intValue;
                            try{
                              intValue = int.parse(value);
                            }catch(e){
                              return;
                            }
                            if (intValue < rangeMin || intValue > rangeMax) {
                              return;
                            }
                            endValue = intValue;
                          }),
                          decoration: InputDecoration(
                              hintText: "$endValue",
                              suffixIcon: const Icon(
                                Icons.euro,
                                size: 20,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: const DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 20,
                        color: PokeTradeSecondaryColor,
                        fontWeight: FontWeight.w500),
                    child: Text(
                      "Edizione",
                    ),
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: edizioniCarte.length,
                  itemBuilder: (context, index) => edizioniCarte[index],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: const DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 20,
                        color: PokeTradeSecondaryColor,
                        fontWeight: FontWeight.w500),
                    child: Text(
                      "Condizione",
                    ),
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: condizioniCarte.length,
                  itemBuilder: (context, index) => condizioniCarte[index],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: PokeTradeSecondaryColor,
                        backgroundColor: PokeTradePrimaryColor, // Background color
                      ),
                      child: const Text("Applica"),
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: PokeTradeSecondaryColor,
                        backgroundColor: PokeTradePrimaryColor, // Background color
                      ),
                      child: const Text("Svuota"),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),

        ),
      ],
    );
  }
}
