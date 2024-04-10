import 'package:flutter/material.dart';

class Ejercicios3 extends StatefulWidget {
  const Ejercicios3({super.key});

  @override
  State<Ejercicios3> createState() => _Ejercicios3State();
}

class _Ejercicios3State extends State<Ejercicios3> {
  bool _caminata30 = false;
  bool _trotar15 = false;
  bool _correr10 = false;
  bool _validarLista = false;
  bool validarDosDeTres() {
    return (_caminata30 && _trotar15 && !_correr10) ||
        (_caminata30 && !_trotar15 && _correr10) ||
        (!_caminata30 && _trotar15 && _correr10);
  }

  void _cambioColorcaminata30() {
    setState(() {
      _caminata30 = !_caminata30;
    });
  }

  void _cambioColortrotar15() {
    setState(() {
      _trotar15 = !_trotar15;
    });
  }

  void _cambioColorcorrer10() {
    setState(() {
      _correr10 = !_correr10;
    });
  }

  void _setLista() {
    if ((_caminata30 && _trotar15 && !_correr10) ||
        (_caminata30 && !_trotar15 && _correr10) ||
        (!_caminata30 && _trotar15 && _correr10)) {
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
      appBar: AppBar(
        title: const Text('Caminar, correr o trotar'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: _caminata30
                    ? const Color.fromARGB(255, 13, 173, 67)
                    : Colors.transparent),
            onPressed: _cambioColorcaminata30,
            child: const Text('Caminata de 30 min'),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: _trotar15
                    ? const Color.fromARGB(255, 13, 173, 67)
                    : Colors.transparent),
            onPressed: _cambioColortrotar15,
            child: const Text('Trotar durante 15 min'),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: _correr10
                    ? const Color.fromARGB(255, 13, 173, 67)
                    : Colors.transparent),
            onPressed: _cambioColorcorrer10,
            child: const Text('Correr durante 10 minutos'),
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
    );
  }
}
