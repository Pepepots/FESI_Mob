import 'package:flutter/material.dart';

class Ejercicios extends StatefulWidget {
  const Ejercicios({super.key});

  @override
  State<Ejercicios> createState() => _EjerciciosState();
}

class _EjerciciosState extends State<Ejercicios> {
  bool _sentadilla = false;
  bool _abdominales = false;
  bool _lagartijas = false;
  bool _validarLista = false;
  bool validarDosDeTres() {
    return (_sentadilla && _abdominales && !_lagartijas) ||
        (_sentadilla && !_abdominales && _lagartijas) ||
        (!_sentadilla && _abdominales && _lagartijas) ||
        (_sentadilla && _abdominales && _lagartijas);
  }

  void _cambioColorSentadilla() {
    setState(() {
      _sentadilla = !_sentadilla;
    });
  }

  void _cambioColorAbdominales() {
    setState(() {
      _abdominales = !_abdominales;
    });
  }

  void _cambioColorLagartijas() {
    setState(() {
      _lagartijas = !_lagartijas;
    });
  }

  void _setValidarLista() {
    if ((_sentadilla && _abdominales && !_lagartijas) ||
        (_sentadilla && !_abdominales && _lagartijas) ||
        (!_sentadilla && _abdominales && _lagartijas)) {
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
        backgroundColor: Color.fromARGB(255, 80, 131, 250),
        title: const Text('Actividad en casa', style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white)
      ),
      body: Center(
        child: Container(
          height: 640,
          width: 290,
          color: Color.fromARGB(55, 80, 131, 250),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: _sentadilla
                        ? Color.fromARGB(60, 29, 106, 240)
                        : Colors.transparent),
                onPressed: _cambioColorSentadilla,
                child: const Text('Sentadilla'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: _abdominales
                        ? Color.fromARGB(60, 29, 106, 240)
                        : Colors.transparent),
                onPressed: _cambioColorAbdominales,
                child: const Text('Abdominales'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: _lagartijas
                        ? Color.fromARGB(60, 29, 106, 240)
                        : Colors.transparent),
                onPressed: _cambioColorLagartijas,
                child: const Text('Lagartijas'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: _validarLista
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : Colors.transparent),
                onPressed: _setValidarLista,
                child: const Text('Listo'),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
