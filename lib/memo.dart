import 'package:flutter/material.dart';
import 'package:mascota/utils/game_logic.dart';

class Memorama extends StatefulWidget {
  const Memorama({super.key});

  @override
  State<Memorama> createState() => _MemoramaState();
}

class _MemoramaState extends State<Memorama> {
  Game _game = Game(4);
  int inten = 0;
  int punto = 0;
  int _crossAxisCount = 2;

  void _updateSize(int cards, int space) {
    setState(() {
      _game = Game(cards);
      _crossAxisCount = space;
      _game.initGame();
    });
  }

  Widget board(String title, int cards, int space) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _updateSize(cards, space),
        child: Container(
          margin: const EdgeInsets.all(26.0),
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 22.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 6.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Memorama'),
      ),
      backgroundColor: const Color.fromRGBO(32, 44, 86, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Memorama",
              style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [board("2x2", 4, 2), board("2x3", 6, 3)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [board("2x4", 8, 4), board("3x4", 12, 4)],
          ),
          SizedBox(
            height: screenWidth,
            width: screenWidth,
            child: GridView.builder(
                itemCount: _game.gameImg!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _crossAxisCount,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0),
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          inten++;
                          _game.gameImg![index] = _game.cardList[index];
                          _game.match.add({index: _game.cardList[index]});
                        });
                        if (_game.match.length == 2) {
                          if (_game.match[0].values.first ==
                              _game.match[1].values.first) {
                            punto += 100;
                            _game.match.clear();
                          } else {
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              setState(() {
                                _game.gameImg![_game.match[0].keys.first] =
                                    _game.hiddenCard;
                                _game.gameImg![_game.match[1].keys.first] =
                                    _game.hiddenCard;
                                _game.match.clear();
                              });
                            });
                          }
                        }
                      },
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(172, 150, 90, 1),
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(_game.gameImg![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ));
                }),
          )
        ],
      ),
    );
  }
}
