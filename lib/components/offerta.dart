import 'package:poketrade/components/carta.dart';

class Offerta{
  late String offerente;
  late String ricevente;
  late List<CartaPokemon> carteDesiderate;
  late Contropartita contropartita;
  Risposta? risposta;
  bool valid = true;
  Stato stato = InCorso();


  Offerta({required this.offerente, required this.ricevente, required this.carteDesiderate, required this.contropartita}){_stateChanged();}

  bool accettaOfferta(){
    return _rispondiOfferta(Risposta.confermata);
  }

  bool rifiutaOfferta(){
    return _rispondiOfferta(Risposta.rifiutata);
  }

  annullaOfferta(){
    valid = false;
    _stateChanged();
  }

  bool _rispondiOfferta(Risposta risposta){
    if(stato.stato != "In corso"){
      return false;
    }
    this.risposta = risposta;
    _stateChanged();

    return true;
  }

  _stateChanged(){
    stato = stato.determinaStato(this);
  }
}

class Contropartita{

}

class ContropartitaScambio extends Contropartita{
  late List<CartaPokemon> carteOfferte;

  ContropartitaScambio({required this.carteOfferte});
}

class ContropartitaAcquisto extends Contropartita{
  late double importoOfferto;

  ContropartitaAcquisto({required this.importoOfferto});

}

abstract class Stato {

  abstract String stato;

  static InCorso inCorso = InCorso();
  static Confermata confermata = Confermata();
  static Rifiutata rifiutata = Rifiutata();
  static Annullata annullata = Annullata();

  Stato determinaStato(Offerta offerta){
    if(offerta.risposta == null){
      if(offerta.valid){
        return inCorso;
      }else{
        return annullata;
      }

    }else if(offerta.risposta == Risposta.confermata){
      return confermata;
    }else{
      return rifiutata;
    }
  }
}

class InCorso extends Stato{
  @override
  String stato = "In corso";

}

class Confermata extends Stato{
  @override
  String stato = "Confermata";

}

class Rifiutata extends Stato{
  @override
  String stato = "Rifiutata";

}

class Annullata extends Stato{
  @override
  String stato = "Annullata";

}

enum Risposta{
 confermata,
 rifiutata,
}