import 'package:flutter/foundation.dart';

// Guarda las adaptaciones que el usuario va marcando.
class AdaptDocumentViewModel extends ChangeNotifier {
  // Ids de las adaptaciones marcadas.
  List<String> adaptacionesMarcadas = [];

  bool estaMarcada(String id) {
    return adaptacionesMarcadas.contains(id);
  }

  void marcarAdaptacion(String id, bool marcada) {
    if (marcada) {
      // Lo compruebo para no meter el mismo id dos veces.
      if (!adaptacionesMarcadas.contains(id)) {
        adaptacionesMarcadas.add(id);
      }
    } else {
      adaptacionesMarcadas.remove(id);
    }
    notifyListeners();
  }
}
