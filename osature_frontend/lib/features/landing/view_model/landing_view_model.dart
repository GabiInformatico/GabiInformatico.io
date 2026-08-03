import 'package:flutter/foundation.dart';

// Guarda si el menu desplegable de movil (la hamburguesa) esta abierto.
class LandingViewModel extends ChangeNotifier {
  bool menuAbierto = false;

  void alternarMenu() {
    menuAbierto = !menuAbierto;
    notifyListeners();
  }

  void cerrarMenu() {
    if (!menuAbierto) return;
    menuAbierto = false;
    notifyListeners();
  }
}
