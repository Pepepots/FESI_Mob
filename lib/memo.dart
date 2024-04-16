import 'package:flutter/material.dart';
import 'package:mascota/actividades.dart';
import 'package:mascota/database.dart';
import 'package:mascota/utils/game_logic.dart';
import 'main.dart';

class Memorama extends StatefulWidget {
  const Memorama({Key? key}) : super(key: key);

  @override
  State<Memorama> createState() => _MemoramaState();
}

class _MemoramaState extends State<Memorama> {
  // final Database database = Database();
  // final dia  = Database().calcularDias();
  Game _game = Game(4);
  int inten = 0;
  int _crossAxisCount = 2;
  bool memoramaCompleto = false;

  void _numCards(int dias) {
    if (dias <= 3) {
      _updateSize(4, 2);
    } else if (dias <= 6) {
      _updateSize(6, 3);
    } else if (dias <= 9) {
      _updateSize(8, 4);
    } else if (dias <= 12) {
      _updateSize(16, 4);
    } else {
      _updateSize(20, 5);
    }
  }

  void _updateSize(int cards, int space) {
    setState(() {
      _game = Game(cards);
      _crossAxisCount = space;
      memoramaCompleto = false;
      _game.initGame();
    });
  }


  @override
  void initState() {
    _numCards(4);
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (memoramaCompleto) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Ni estaba tan dificil, inutil'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Vuelve mañana por mas'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cerrar'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Actividades()));
                  },
                ),
              ],
            );
          },
        );
      });
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 80, 131, 250),
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
            height: 18.0,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [board("2x2", 4, 2), board("3x2", 6, 3)],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [board("4x3", 12, 4), board("4x4", 16, 4)],
          // ),
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
                            _game.match.clear();
                            if (_game.gameImg!
                                .every((img) => img != _game.hiddenCard)) {
                              memoramaCompleto = true;
                            }
                          } else {
                            Future.delayed(const Duration(milliseconds: 200),
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
                          color: const Color.fromARGB(255, 7, 71, 180),
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(_game.gameImg![index]),
                            fit: BoxFit.contain,
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
