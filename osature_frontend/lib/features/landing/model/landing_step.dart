import '../../../l10n/app_localizations.dart';

// Un paso del bloque "Como funciona". Guarda un id, no el texto: el
// texto sale siempre de l10n para poder traducirlo.
class LandingStep {
  const LandingStep({required this.id});

  final String id;

  String titulo(AppLocalizations l10n) {
    switch (id) {
      case 'subir':
        return l10n.landing_paso_subir_titulo;
      case 'elegir':
        return l10n.landing_paso_elegir_titulo;
      case 'descargar':
        return l10n.landing_paso_descargar_titulo;
    }
    return '';
  }

  String descripcion(AppLocalizations l10n) {
    switch (id) {
      case 'subir':
        return l10n.landing_paso_subir_descripcion;
      case 'elegir':
        return l10n.landing_paso_elegir_descripcion;
      case 'descargar':
        return l10n.landing_paso_descargar_descripcion;
    }
    return '';
  }
}

// Pasos del bloque "Como funciona", en orden.
const List<LandingStep> landingSteps = [
  LandingStep(id: 'subir'),
  LandingStep(id: 'elegir'),
  LandingStep(id: 'descargar'),
];
