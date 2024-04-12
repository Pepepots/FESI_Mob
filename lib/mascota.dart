import 'package:flutter/material.dart';
import 'package:mascota/Providers/variableGlobal.dart';
import 'package:mascota/actividades.dart';
import 'package:provider/provider.dart';

class Mascota extends StatelessWidget {
  const Mascota({super.key});

  @override
  Widget build(BuildContext context) {
    VariableGlobal watch = context.watch<VariableGlobal>();
    //context.read<VariableGlobal>().setEstado('True');
    return Container(
        color: Color.fromARGB(255, 80, 131, 250),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://res.cloudinary.com/pepepots9414/image/upload/v1651287045/frappe-782544_ktsv6b.png'),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Recompesas'),
                  ),
                  
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Actividades()));
                      },
                      child: const Text('Actividades'),
                  ),
                ],
              ),
/*               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(watch.estado,
                  style: TextStyle(color: Colors.white))
                ],
              ) */
            ],
          ),
        ));
  }
}
