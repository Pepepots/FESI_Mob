import 'package:flutter/material.dart';

class Relajacion extends StatelessWidget {
  const Relajacion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
          child: Text(
        'Relajacion',
        style: TextStyle(fontSize: 40, color: Colors.white),
      )),
    );
  }
}
