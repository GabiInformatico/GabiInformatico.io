import '../../../l10n/app_localizations.dart';

// Un plan del bloque "Servicios". Guarda un id, no el texto: el texto
// sale siempre de l10n para poder traducirlo.
class LandingPlan {
  const LandingPlan({required this.id, this.destacado = false});

  final String id;
  // El plan destacado lleva borde azul y la etiqueta "Recomendada".
  final bool destacado;

  String titulo(AppLocalizations l10n) {
    switch (id) {
      case 'gratis':
        return l10n.landing_plan_gratis_titulo;
      case 'premium':
        return l10n.landing_plan_premium_titulo;
    }
    return '';
  }

  String precio(AppLocalizations l10n) {
    switch (id) {
      case 'gratis':
        return l10n.landing_plan_gratis_precio;
      case 'premium':
        return l10n.landing_plan_premium_precio;
    }
    return '';
  }

  String descripcion(AppLocalizations l10n) {
    switch (id) {
      case 'gratis':
        return l10n.landing_plan_gratis_descripcion;
      case 'premium':
        return l10n.landing_plan_premium_descripcion;
    }
    return '';
  }

  List<String> caracteristicas(AppLocalizations l10n) {
    switch (id) {
      case 'gratis':
        return [
          l10n.landing_plan_gratis_caracteristica_1,
          l10n.landing_plan_gratis_caracteristica_2,
        ];
      case 'premium':
        return [
          l10n.landing_plan_premium_caracteristica_1,
          l10n.landing_plan_premium_caracteristica_2,
        ];
    }
    return const [];
  }

  String textoBoton(AppLocalizations l10n) {
    switch (id) {
      case 'gratis':
        return l10n.landing_plan_gratis_boton;
      case 'premium':
        return l10n.landing_plan_premium_boton;
    }
    return '';
  }

  // Solo el plan destacado tiene etiqueta.
  String? badge(AppLocalizations l10n) {
    return id == 'premium' ? l10n.landing_plan_premium_badge : null;
  }
}

// Planes del bloque "Servicios", en orden.
const List<LandingPlan> landingPlans = [
  LandingPlan(id: 'gratis'),
  LandingPlan(id: 'premium', destacado: true),
];
