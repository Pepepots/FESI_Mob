import 'dart:math';

class Game {
  final String hiddenCard = 'assets/images/pregunta.png';
  List<String>? gameImg;

  final List<String> allCard = [
    "assets/images/circulo.png",
    "assets/images/cuadrado.png",
    "assets/images/rombo.png",
    "assets/images/triangulo.png",
    "assets/images/estrella.png",
    "assets/images/pentagono.png",
    "assets/images/elipse.png",
    "assets/images/rectangulo.png",
    "assets/images/semicirculo.png",
    "assets/images/trapecio.png"
  ];

  int dias;
  final List<String> cardList = [];
  Set<String> usedCards = {};
  List<Map<int, String>> match = [];
  int cartas = 0;
  Game(this.dias) {
    if (dias <= 3) {
      cartas = 4;
    } else if (dias > 3 && dias <= 6) {
      cartas = 6;
    } else if (dias > 6 && dias <= 9) {
      cartas = 12;
    } else if (dias > 9 && dias <= 12) {
      cartas = 18;
    } else if (dias > 12 && dias <= 15) {
      cartas = 20;
    }
  }

  void initGame() {
    Random random = new Random();
    while (cardList.length < cartas) {
      String randomCard = allCard[random.nextInt(allCard.length)];
      if (!usedCards.contains(randomCard)) {
        cardList.add(randomCard);
        cardList.add(randomCard);
        usedCards.add(randomCard);
      }
    }
    cardList.shuffle();

    gameImg = List.generate(cartas, (index) => hiddenCard);
  }
}
