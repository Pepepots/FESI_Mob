import 'package:flutter/material.dart';

class Memorama extends StatelessWidget {
  const Memorama({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
          child: Text(
        'Memorama',
        style: TextStyle(fontSize: 40, color: Colors.white),
      )),
    );
  }
}
