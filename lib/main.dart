import 'package:flutter/material.dart';
import 'package:mascota/Providers/variableGlobal.dart';
import 'package:provider/provider.dart';
import 'package:mascota/mascota.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<VariableGlobal>(create: (_)=>VariableGlobal())
        ],
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
              title: 'Mascota',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(6, 4, 81, 248)),
                useMaterial3: true,
              ),
              home: const Mascota());
        }
      );
  }
}
