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
            myBox('./assets/images/fichaPiedra.png'),
            myBox('./assets/images/libroRoca-Photoroom.png'),
            myBox('./assets/images/pesaRoca.png'),
            myBox('./assets/images/meditacionFase1.png'),
            myBox('./assets/images/fichaCobre.png'),
            myBox('./assets/images/libroCobre-Photoroom.png'),
            myBox('./assets/images/pesaBronce.png'),
            myBox('./assets/images/meditacionCobre.png'),
            myBox('./assets/images/fichaPlata.png'),
            myBox('./assets/images/libroPlata-Photoroom.png'),
            myBox('./assets/images/PesaPlata.png'),
            myBox('./assets/images/meditacionPlata.png'),
            myBox('./assets/images/fichOro.png'),
            myBox('./assets/images/libroOro-Photoroom.png'),
            myBox('./assets/images/pesaOro.png'),
            myBox('./assets/images/meditacionPlata.png'),
            myBox('./assets/images/fichaDiamate.png'),
            myBox('./assets/images/libroDiamante-Photoroom.png'),
            myBox('./assets/images/pesDiamante-Photoroom.png'),
            myBox('./assets/images/meditacionPlata.png'),
          ],
        ),
      ),
    );
  }
}

Widget myBox( String imagePath){
  return Container(
    //margin: const EdgeInsets.all(8),
    color: const Color.fromARGB(255, 87, 168, 234),
    alignment: Alignment.center,
    child: Image.asset(imagePath),
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
