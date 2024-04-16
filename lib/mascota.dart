import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mascota/actividades.dart';
import 'package:mascota/recompensas.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mascota extends StatelessWidget {
  const Mascota({super.key});

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
    setInitialDate();
    guardarJson(actividadesJson);

    return Container(
        color: Color.fromARGB(255, 80, 131, 250),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://res.cloudinary.com/pepepots9414/image/upload/v1651287045/frappe-782544_ktsv6b.png'),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const GridViewWidget() ));
                    },
                    child: const Text('Recompesas'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // int dias = await calcularDias();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Actividades(),
                          ));
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
