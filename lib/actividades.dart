import 'package:flutter/material.dart';
import 'package:mascota/ejercicio.dart';
import 'package:mascota/estudio.dart';
import 'package:mascota/memo.dart';
import 'package:mascota/relajacion.dart';

class Actividades extends StatelessWidget {
  const Actividades({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 80, 131, 250),
      body: Padding(
        padding: const EdgeInsets.all(40.0), //Ajustar padding para el center XD
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 15, //  espacio horizontal entre los elementos
            mainAxisSpacing: 35, // espacio vertical entre los elementos
            shrinkWrap: true, // True para efecto del Center
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Ejercicio()));
                  },
                  child: const Text('Ejercicio')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Estudio()));
                  },
                  child: const Text('Estudio')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Memorama()));
                  },
                  child: const Text('Memorama')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Relajacion()));
                  },
                  child: const Text('Relajacion')),
            ],
          ),
        ),
      ),
    );
  }
}
