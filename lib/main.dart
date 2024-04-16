import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mascota/mascota.dart';
import 'database.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Database database = Database();
  var dias = 0;

  @override
  void initState() {
    super.initState();
    database.setInitialDate();
    _calcularDias();
  }

  void _calcularDias() async {
    final int diasResult =
        await database.calcularDias(); // Esperar el resultado
    setState(() {
      dias = diasResult; // Asignar el resultado a la variable 'dias'
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mascota',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(6, 4, 81, 248)),
          useMaterial3: true,
        ),
        home: const Mascota());
  }
}
