import 'package:flutter/material.dart';
import 'package:mascota/ejercicios/button.dart';
import 'package:mascota/ejercicios/button2.dart';
import 'package:mascota/ejercicios/button3.dart';
import 'package:mascota/ejercicios/button4.dart';

class Ejercicio extends StatelessWidget {
  const Ejercicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
            child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15, //  espacio horizontal entre los elementos
          mainAxisSpacing: 35, // espacio vertical entre los elementos
          shrinkWrap: true, // True para efecto del Center
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 80, 131, 255),
                // fixedSize: const Size(150, 150),
              ),
              child: const Text(
                textAlign: TextAlign.center,
                'ACTIVIDAD EN CASA',
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              onPressed: () {
                //Ir a la segunda pantalla
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ejercicios()));
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 80, 131, 255),
                // fixedSize: const Size(150, 150),
              ),
              child: const Text(
                textAlign: TextAlign.center,
                'GIMNASIO DE PESAS',
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              onPressed: () {
                //Ir a la segunda pantalla
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ejercicios2()));
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 80, 131, 255),
                // fixedSize: const Size(150, 150),
              ),
              child: const Text(
                textAlign: TextAlign.center,
                'CAMINAR CORRER TROTAR',
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              onPressed: () {
                //Ir a la segunda pantalla
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ejercicios3()));
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 80, 131, 255),
                // fixedSize: const Size(150, 150),
              ),
              child: const Text(
                textAlign: TextAlign.center,
                'DEPORTE',
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              onPressed: () {
                //Ir a la segunda pantalla
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ejercicios4()));
              },
            ),
          ],
        )),
      ),
    );
  }
}
