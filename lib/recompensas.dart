import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recompensas', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 0.5,
            crossAxisSpacing: 5,
          ),
          children: [
            myBoxText('Memorama'),
            myBoxText('Estudio'),
            myBoxText('Ejercicio'),
            myBoxText('Relajación'),
            myBox('./assets/images/fichaPiedra.png', 1),
            myBox('./assets/images/libroRoca-Photoroom.png', 1),
            myBox('./assets/images/pesaRoca.png', 1),
            myBox('./assets/images/meditacionFase1.png', 1),
            myBox('./assets/images/fichaCobre.png', 0.5),
            myBox('./assets/images/libroCobre-Photoroom.png', 0.5),
            myBox('./assets/images/pesaBronce.png', 0.5),
            myBox('./assets/images/meditacionCobre.png', 0.5),
            myBox('./assets/images/fichaPlata.png', 0.5),
            myBox('./assets/images/libroPlata-Photoroom.png', 0.5),
            myBox('./assets/images/PesaPlata.png', 0.5),
            myBox('./assets/images/meditacionPlata.png', 0.5),
            myBox('./assets/images/fichOro.png', 0.5),
            myBox('./assets/images/libroOro-Photoroom.png', 0.5),
            myBox('./assets/images/pesaOro.png', 0.5),
            myBox('./assets/images/meditacionPlata.png', 0.5),
            myBox('./assets/images/fichaDiamate.png', 0.5),
            myBox('./assets/images/libroDiamante-Photoroom.png', 0.5),
            myBox('./assets/images/pesDiamante-Photoroom.png', 0.5),
            myBox('./assets/images/meditacionPlata.png', 0.5),
          ],
        ),
      ),
    );
  }
}

Widget myBox( String imagePath, double opacity){
  return Container(
    //margin: const EdgeInsets.all(8),
    color: const Color.fromARGB(255, 87, 168, 234),
    alignment: Alignment.center,
    child: Opacity(opacity: opacity, child: Image.asset(imagePath)),
  );
}

Widget myBoxText( String text){
  return Container(
    //margin: const EdgeInsets.all(8),
    color: const Color.fromARGB(255, 87, 168, 234),
    alignment: Alignment.center,
    child: Text('$text', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
  );
}
