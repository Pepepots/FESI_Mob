import 'package:flutter/material.dart';
import 'package:mascota/mascota.dart';
import 'database.dart';

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
  int _dias = 0;

  int get dias => _dias;

  @override
  void initState() {
    super.initState();
    database.setInitialDate();
    _calcularDias();
    database.loadActivities();
  }

  void _calcularDias() async {
    final int diasResult = await database.calcularDias();
    setState(() {
      _dias = diasResult;
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
