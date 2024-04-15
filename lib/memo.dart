import 'package:flutter/material.dart';
import 'package:mascota/actividades.dart';
import 'package:mascota/mascota.dart';
import 'package:mascota/utils/game_logic.dart';

class Memorama extends StatefulWidget {
  const Memorama({Key? key}) : super(key: key);

  @override
  State<Memorama> createState() => _MemoramaState();
}

class _MemoramaState extends State<Memorama> {
  List<String> dias = [
    'Dia1',
    'Dia2',
    'Dia3',
    'Dia4',
    'Dia5',
    'Dia6',
    'Dia7',
    'Dia8',
    'Dia9',
    'Dia10',
    'Dia11',
    'Dia12',
    'Dia13',
    'Dia14',
    'Dia15'
  ];
  int dia = 0;
  late Game _game;
  @override
  void initState() {
    super.initState();
    _game = Game(dia);
  }

  int inten = 0;
  int _crossAxisCount = 2;
  bool memoramaCompleto = false;

  void completarMemorama() {
    Mascota.actividadesJson[dias[dia]]['Memorama'] = true;
  }

  void _updateSize(int cards, int space) {
    setState(() {
      _game = Game(dia);
      _crossAxisCount = space;
      memoramaCompleto = false;
      completarMemorama();
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
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (memoramaCompleto) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Ni estaba tan dificil'),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [board("2x2", 4, 2), board("3x2", 6, 3)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [board("4x3", 12, 4), board("4x4", 16, 4)],
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
                          color: Color.fromARGB(255, 7, 71, 180),
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
