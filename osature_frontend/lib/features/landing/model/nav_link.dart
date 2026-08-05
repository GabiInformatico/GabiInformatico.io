import '../../../l10n/app_localizations.dart';

// Un enlace del menu de la cabecera. Guarda un id, no el texto: el texto
// sale siempre de l10n para poder traducirlo.
class NavLink {
  const NavLink({required this.id});

  final String id;

  // Traduce este enlace con los textos del idioma actual.
  String texto(AppLocalizations l10n) {
    switch (id) {
      case 'como-funciona':
        return l10n.landing_nav_como_funciona;
      case 'servicios':
        return l10n.landing_nav_servicios;
      case 'preguntas-frecuentes':
        return l10n.landing_nav_preguntas_frecuentes;
      case 'casos-de-exito':
        return l10n.landing_nav_casos_exito;
      case 'blog':
        return l10n.landing_nav_blog;
      case 'sobre-nosotros':
        return l10n.landing_footer_sobre_nosotros;
    }
    return '';
  }
}

// Enlaces del menu de la cabecera, en el mismo orden que en el mockup.
const List<NavLink> landingNavLinks = [
  NavLink(id: 'como-funciona'),
  NavLink(id: 'servicios'),
  NavLink(id: 'preguntas-frecuentes'),
  NavLink(id: 'casos-de-exito'),
  NavLink(id: 'blog'),
];
