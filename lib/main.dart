import 'package:flutter/material.dart';
import 'package:poketrade/account_setting.dart';
import 'package:poketrade/area_carte.dart';
import 'package:poketrade/lista_chat.dart';
import 'package:poketrade/home.dart';
import 'package:poketrade/providers/area_carte_provider.dart';
import 'package:poketrade/providers/chat_provider.dart';
import 'package:poketrade/providers/offerte_provider.dart';
import 'package:poketrade/ricerca.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AreaCarteProvider()),
    ChangeNotifierProvider(create: (context) => OfferteProvider()),
    ChangeNotifierProvider(create: (context) => ChatProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokéTrade',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'PokéTrade'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  final double _width = 60.0;

  String username = "Cuggio33";

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
   return MaterialApp(
     title: "PokéTrade",
     theme: ThemeData(),
     home: DefaultTabController(
       length: 5,
       child: Scaffold(
         extendBodyBehindAppBar: true,
         bottomNavigationBar: Container(
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(10),
                 topRight: Radius.circular(10),
                 bottomLeft: Radius.circular(10),
                 bottomRight: Radius.circular(10)
             ),
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.withOpacity(0.5),
                 spreadRadius: 5,
                 blurRadius: 7,
                 offset: const Offset(0, 3), // changes position of shadow
               ),
             ],
           ),
           child: TabBar(
             labelColor: Colors.red,
             unselectedLabelColor: Colors.black,
             indicatorColor: Colors.transparent,
             isScrollable: true,
             labelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
             padding: EdgeInsets.zero,
             labelPadding: EdgeInsets.only(left: orientation == Orientation.portrait ? 10 : 75),
             onTap: (x) {
               setState(() {
                 _index = x;
               });
             },
             tabs: [
               SizedBox(
                 //color: Colors.red,
                 width: _width,
                 child: Tab(
                   text: "Carte",
                   icon: ImageIcon(const AssetImage("assets/icons/carte_icon_selected.png"), size: 35, color: _index==0 ? Colors.red : Colors.black,)
                 ),
               ),
               SizedBox(
                 //color: Colors.blue,
                 width: _width,
                 child: Tab(
                   text: "Chat",
                   icon: ImageIcon(const AssetImage("assets/icons/chat_icon_selected.png"), size: 35, color: _index==1 ? Colors.red : Colors.black,)
                 ),
               ),
               SizedBox(
                 //color: Colors.green,
                 width: _width,
                 child: Tab(
                   text: "Home",
                   icon: ImageIcon(const AssetImage("assets/icons/home_icon_selected.png"), size: 35, color: _index==2 ? Colors.red : Colors.black,)

                 ),
               ),
               SizedBox(
                 //color: Colors.brown,
                 width: _width,
                 child: Tab(
                   text: "Ricerca",
                   icon: ImageIcon(const AssetImage("assets/icons/ricerca_icon_selected.png"), size: 35, color: _index==3 ? Colors.red : Colors.black,)
                 ),
               ),
               SizedBox(
                 //color: Colors.orange,
                 width: _width,
                 child: Tab(
                   text: "Account",
                   icon: ImageIcon(const AssetImage("assets/icons/profilo_icon_selected.png"), size: 35, color: _index==4 ? Colors.red : Colors.black,)
                 ),
               ),
             ],
           ),
         ),
         body: TabBarView(
           physics: const NeverScrollableScrollPhysics(),
           children: [
             AreaCarte(username: username),
             ListaChat(username: username,),
             Home(username: username,),
             Ricerca(username: username,),
             const Account(),
           ],
         ),
       ),

       ),
     );
  }
}
