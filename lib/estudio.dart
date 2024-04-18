import 'package:flutter/material.dart';
import 'package:mascota/dialog_widget.dart';

class Estudio extends StatefulWidget {
  const Estudio({Key? key}) : super(key: key);

  @override
  State<Estudio> createState() => _EstudioState();
}

class _EstudioState extends State<Estudio> {
  final List<String> _questions = [
    '¿Tuviste suficiente luz?',
    '¿Estuvo bien la hora?',
    '¿Estuviste en el lugar adecuado?',
    '¿Tuviste los objetos necesarios?',
    '¿Descansaste lo suficiente?',
    '¿Tuviste suficiente energía?',
    '¿Estuviste cómodo en general?',
  ];
  final List<bool> _answers = List.filled(7, false);
  int _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 80, 131, 250),
      body: _questionIndex < _questions.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _questions[_questionIndex],
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _answers[_questionIndex] = true;
                          _questionIndex++;
                        });
                      },
                      child: const Text('Sí'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _questionIndex++;
                        });
                      },
                      child: const Text('No'),
                    ),
                  ],
                ),
              ],
            )
          : _answers.where((answer) => answer).length >= 4
              ? const DialogWidget()
              : const DialogWidget()
    );
  }
}
