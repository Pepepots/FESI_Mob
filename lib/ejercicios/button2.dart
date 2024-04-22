import 'package:flutter/material.dart';

class Ejercicios2 extends StatefulWidget {
  const Ejercicios2({super.key});

  @override
  State<Ejercicios2> createState() => _Ejercicios2State();
}

class _Ejercicios2State extends State<Ejercicios2> {
  bool _pressBanca = false;
  bool _maquinaRemo = false;
  bool _sentadillaSmith = false;
  bool _validarLista = false;
  bool validarDosDeTres(bool a, bool b, bool c) {
    return (_pressBanca && _maquinaRemo && !_sentadillaSmith) ||
        (_pressBanca && !_maquinaRemo && _sentadillaSmith) ||
        (!_pressBanca && _maquinaRemo && _sentadillaSmith);
  }

  void _cambioColorpressBanca() {
    setState(() {
      _pressBanca = !_pressBanca;
    });
  }

  void _cambioColormaquinaRemo() {
    setState(() {
      _maquinaRemo = !_maquinaRemo;
    });
  }

  void _cambioColorsentadillaSmith() {
    setState(() {
      _sentadillaSmith = !_sentadillaSmith;
    });
  }

  void _setLista() {
    if ((_pressBanca && _maquinaRemo && !_sentadillaSmith) ||
        (_pressBanca && !_maquinaRemo && _sentadillaSmith) ||
        (!_pressBanca && _maquinaRemo && _sentadillaSmith)) {
      setState(() {
        _validarLista = true;
      });
    } else {
      setState(() {
        _validarLista = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 131, 250),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Gimnasio de pesas',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          height: 640,
          width: 290,
          color: const Color.fromARGB(50, 80, 131, 253),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: _pressBanca
                        ? const Color.fromARGB(60, 29, 106, 240)
                        : Colors.transparent),
                onPressed: _cambioColorpressBanca,
                child: const Text('Press Banca'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: _maquinaRemo
                        ? const Color.fromARGB(60, 29, 106, 240)
                        : Colors.transparent),
                onPressed: _cambioColormaquinaRemo,
                child: const Text('Maquina de Remo'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: _sentadillaSmith
                        ? const Color.fromARGB(60, 29, 106, 240)
                        : Colors.transparent),
                onPressed: _cambioColorsentadillaSmith,
                child: const Text('Sentadilla en maquina Smith'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: _validarLista
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : Colors.transparent),
                onPressed: _setLista,
                child: const Text('Listo'),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
