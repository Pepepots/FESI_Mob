import 'package:flutter/material.dart';

class Ejercicio extends StatelessWidget {
  const Ejercicio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
          child: Text(
        'Ejercicio',
        style: TextStyle(fontSize: 40, color: Colors.white),
      )),
    );
  }
}
