import 'package:flutter/material.dart';

class VariableGlobal with ChangeNotifier {
  String _estado = 'False';

  String get estado {
    return _estado;
  }

  void setEstado(String estado){
    _estado = estado;

    notifyListeners();
  }
}