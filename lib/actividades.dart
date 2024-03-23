import 'package:flutter/material.dart';
import 'package:mascota/ejercicio.dart';
import 'package:mascota/estudio.dart';
import 'package:mascota/memo.dart';
import 'package:mascota/relajacion.dart';

class Actividades extends StatelessWidget {
  const Actividades({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades'),
      ),
      backgroundColor: Colors.indigo,
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ejercicio()));
              },
              child: const Text('Ejercicio')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Estudio()));
              },
              child: const Text('Estudio')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Memorama()));
              },
              child: const Text('Memorama')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Relajacion(
                              title: 'Hola',
                            )));
              },
              child: const Text('Relajacion')),
        ],
      ),
    );
  }
}
