import 'package:flutter/material.dart';
import 'package:mascota/dialog_widget.dart';

class Ejercicios4 extends StatefulWidget {
  const Ejercicios4({super.key});

  @override
  State<Ejercicios4> createState() => _Ejercicios4State();
}

class _Ejercicios4State extends State<Ejercicios4> {
  bool _futbol = false;
  bool _taekwondo = false;
  bool _atletismo = false;
  bool _validarLista = false;
  bool validarDosDeTres(bool a, bool b, bool c) {
    return (_futbol && _taekwondo && !_atletismo) ||
        (_futbol && !_taekwondo && _atletismo) ||
        (!_futbol && _taekwondo && _atletismo);
  }

  void _cambioColorfutbol() {
    setState(() {
      _futbol = !_futbol;
    });
  }

  void _cambioColortaekwondo() {
    setState(() {
      _taekwondo = !_taekwondo;
    });
  }

  void _cambioColoratletismo() {
    setState(() {
      _atletismo = !_atletismo;
    });
  }

  void _setLista() {
    if ((_futbol && _taekwondo && !_atletismo) ||
        (_futbol && !_taekwondo && _atletismo) ||
        (!_futbol && _taekwondo && _atletismo) ||
        (_futbol && _taekwondo && _atletismo)) {
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
      body: _validarLista ? const DialogWidget() : Center(
        child: Container(
          height: 640,
          width: 290,
          color: Color.fromARGB(50, 80, 131, 253),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: _futbol
                        ? Color.fromARGB(60, 29, 106, 240)
                        : Colors.transparent),
                onPressed: _cambioColorfutbol,
                child: const Text('Futbol'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: _taekwondo
                        ? Color.fromARGB(60, 29, 106, 240)
                        : Colors.transparent),
                onPressed: _cambioColortaekwondo,
                child: const Text('Taekwodo'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: _atletismo
                        ? Color.fromARGB(60, 29, 106, 240)
                        : Colors.transparent),
                onPressed: _cambioColoratletismo,
                child: const Text('Atletismo'),
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
