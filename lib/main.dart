import 'package:flutter/material.dart';
import 'package:mascota/mascota.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> setInitialDate() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('fechaInicio')) {
      prefs.setString('fechaInicio', DateTime.now().toIso8601String());
    }
  }

  Future<int> calcularDias() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('fechaInicio')) {
      DateTime fechaInicio = DateTime.parse(prefs.getString('fechaInicio')!);
      DateTime fechaActual = DateTime.now();
      return fechaActual.difference(fechaInicio).inDays;
    }
    return 0;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mascota',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Mascota());
  }
}
