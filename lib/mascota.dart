import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mascota/actividades.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mascota extends StatelessWidget {
  const Mascota({super.key});

  static Map<String, dynamic> actividadesJson = {
    "Dia1": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia2": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia3": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia4": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia5": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia6": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia7": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia8": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia9": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia10": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia11": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia12": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia13": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia14": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    },
    "Dia15": {
      "Ejercicio": false,
      "Memorama": false,
      "Relajacion": false,
      "Estudio": false
    }
  };

  Future<void> guardarJson(Map<String, dynamic> json) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(json); // Convertir el JSON a String
    await prefs.setString("clave", jsonString);
  }

  Future<String?> leerTexto() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("clave");
  }

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
