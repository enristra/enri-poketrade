class CartaPokemon{
  late String nome;
  late String edizione;
  late double prezzo;
  late String condizione;
  late String image;
  late String profilo;

  CartaPokemon({required this.nome, required this.edizione, required this.prezzo, required this.image, required this.condizione, this.profilo="default.jpg"});

}

List carte_scambio = [
  CartaPokemon(nome: "Groudon", edizione: "Edizione1",prezzo: 35.0, image: "groudon.jpg", condizione: "Come nuovo"),
  //CartaPokemon(prezzo: 35.0, image: "mewtwo.jpg", condizione: "Buono"),
  //CartaPokemon(prezzo: 35.0, image: "axew.jpg", condizione: "Decente"),
  //CartaPokemon(prezzo: 35.0, image: "pickachu_1.jpg", condizione: "Come nuovo"),
];