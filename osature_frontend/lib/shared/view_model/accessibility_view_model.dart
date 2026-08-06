import 'package:flutter/foundation.dart';

// Guarda las opciones de accesibilidad que el usuario elige en la barra
// de arriba.
class AccessibilityViewModel extends ChangeNotifier {
  bool altoContraste = false;

  void cambiarContraste() {
    altoContraste = !altoContraste;
    notifyListeners();
  }
}
