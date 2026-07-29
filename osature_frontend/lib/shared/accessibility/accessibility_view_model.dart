import 'package:flutter/foundation.dart';

// Guarda las opciones de accesibilidad que el usuario elige en la barra
// de arriba.
class AccessibilityViewModel extends ChangeNotifier {
  bool altoContraste = false;

  // TODO: de momento no cambia los colores, solo el boton.
  void cambiarContraste() {
    altoContraste = !altoContraste;
    notifyListeners();
  }
}
