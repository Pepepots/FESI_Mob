import 'package:flutter/material.dart';
import 'package:mascota/actividades.dart';

class Mascota extends StatelessWidget {
  const Mascota({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                  'https://res.cloudinary.com/pepepots9414/image/upload/v1651287045/frappe-782544_ktsv6b.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Recompesas')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Actividades()));
                      },
                      child: const Text('Actividades'))
                ],
              )
            ],
          ),
        ));
  }
}
