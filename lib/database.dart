import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Database {
  int day = 0;
  Future<Map<String, dynamic>> loadActivities() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String activitiesString = prefs.getString('activities') ?? '{}';
    return json.decode(activitiesString);
  }

  Future<void> updateActivityStatus(
      int day, String activityName, bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> activities = await loadActivities();

    String dayKey =
        "Dia$day"; // Convierte el número del día a una clave de mapa, por ejemplo "Dia1"
    if (!activities.containsKey(dayKey)) {
      activities[dayKey] = {
        "Ejercicio": false,
        "Memorama": false,
        "Relajacion": false,
        "Estudio": false
      };
    }
    activities[dayKey][activityName] = status;
    await prefs.setString('activities', json.encode(activities));
  }

  Future<Map<String, dynamic>> getActivitiesForDay(int day) async {
    Map<String, dynamic> activities = await loadActivities();
    String dayKey = "Dia$day";
    return activities[dayKey] ??
        {
          "Ejercicio": false,
          "Memorama": false,
          "Relajacion": false,
          "Estudio": false
        };
  }

  void markActivityAsComplete(int day, String activity) {
    Database manager = Database();
    manager.updateActivityStatus(day, activity, true);
  }

  void showActivitiesForDay(int day) async {
    Database manager = Database();
    Map<String, dynamic> activities = await manager.getActivitiesForDay(day);
    print("Actividades para el día $day: $activities");
  }

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
      print(fechaInicio);
      DateTime fechaActual = DateTime.now();
      return fechaActual.difference(fechaInicio).inDays;
    }
    return 0;
  }
}
