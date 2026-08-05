import '../../../l10n/app_localizations.dart';
import 'nav_link.dart';

// Una columna de enlaces del pie (Producto, Recursos...). Reutiliza
// NavLink para los propios enlaces, porque varios ya existen en el menu
// de la cabecera.
class FooterLinkGroup {
  const FooterLinkGroup({required this.id, required this.enlaces});

  final String id;
  final List<NavLink> enlaces;

  String titulo(AppLocalizations l10n) {
    switch (id) {
      case 'producto':
        return l10n.landing_footer_producto;
      case 'recursos':
        return l10n.landing_footer_recursos;
    }
    return '';
  }
}

// Columnas de enlaces del pie, en el mismo orden que en el mockup.
const List<FooterLinkGroup> footerLinkGroups = [
  FooterLinkGroup(
    id: 'producto',
    enlaces: [
      NavLink(id: 'como-funciona'),
      NavLink(id: 'servicios'),
    ],
  ),
  FooterLinkGroup(
    id: 'recursos',
    enlaces: [
      NavLink(id: 'sobre-nosotros'),
      NavLink(id: 'preguntas-frecuentes'),
      NavLink(id: 'blog'),
    ],
  ),
];
