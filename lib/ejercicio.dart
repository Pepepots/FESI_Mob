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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: AppBar(
          title: const Text('Actividades'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(padding: EdgeInsets.all(20.0)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lime[900],
                    // fixedSize: const Size(150, 150),
                  ),
                  child: const Text(
                    'Actividad en casa',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  onPressed: () {
                    //Ir a la segunda pantalla
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Ejercicios()));
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lime[900],
                  ),
                  child: const Text(
                    'Gimnasio de pesas',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  onPressed: () {
                    //Ir a la segunda pantalla
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Ejercicios2()));
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(padding: EdgeInsets.all(20.0)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lime[900],
                    // fixedSize: const Size(150, 150),
                  ),
                  child: const Text(
                    'Caminar, correr, trotar',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  onPressed: () {
                    //Ir a la segunda pantalla
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Ejercicios3()));
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lime[900],
                  ),
                  child: const Text(
                    'Deporte',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  onPressed: () {
                    //Ir a la segunda pantalla
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Ejercicios4()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
