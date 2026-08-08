import 'package:flutter/foundation.dart';

import '../model/output_format.dart';
import '../model/uploaded_document.dart';

// Guarda lo que el usuario va eligiendo para adaptar un documento.
class AdaptDocumentViewModel extends ChangeNotifier {
  // Mientras no haya documento se ve la zona de subida.
  UploadedDocument? documento;

  // Ids de las adaptaciones marcadas.
  List<String> adaptacionesMarcadas = [];

  String formato = outputFormats.first.id;

  // Perfil elegido en el desplegable. A null es que no hay ninguno.
  String? perfil;

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

  void subirDocumento() {
    documento = documentoDePrueba;
    notifyListeners();
  }

  void quitarDocumento() {
    documento = null;
    notifyListeners();
  }

  void cambiarFormato(String id) {
    formato = id;
    notifyListeners();
  }

  void elegirPerfil(String? id) {
    perfil = id;
    notifyListeners();
  }

  // Nombre del formato elegido, para el resumen.
  String get nombreFormato {
    return outputFormats.firstWhere((f) => f.id == formato).nombre;
  }
}
