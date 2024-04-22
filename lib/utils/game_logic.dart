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

  int dias = 0;
  final List<String> cardList = [];
  Set<String> usedCards = {};
  List<Map<int, String>> match = [];
  int cardCount;
  Game(this.cardCount);

  void initGame() {
    Random random = Random();
    while (cardList.length < cardCount) {
      String randomCard = allCard[random.nextInt(allCard.length)];
      if (!usedCards.contains(randomCard)) {
        cardList.add(randomCard);
        cardList.add(randomCard);
        usedCards.add(randomCard);
      }
    }
    cardList.shuffle();

    gameImg = List.generate(cardCount, (index) => hiddenCard);
  }
}
