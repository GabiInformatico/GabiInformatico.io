import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../model/nav_link.dart';
import '../../view_model/landing_view_model.dart';

// Panel con los enlaces del menu, uno debajo de otro, que aparece pegado
// a la cabecera cuando se abre la hamburguesa en movil. Se pinta por
// encima del resto de la pagina, no la empuja hacia abajo.
class LandingMobileMenu extends StatelessWidget {
  const LandingMobileMenu({super.key});

  // Alto de la cabecera (74 + el borde de abajo), para saber donde
  // empieza el desplegable.
  static const double _altoCabecera = 75;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LandingViewModel>();
    if (!viewModel.menuAbierto) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context);

    return Positioned(
      top: _altoCabecera,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.blanco,
          border: Border(bottom: BorderSide(color: AppColors.borde)),
          boxShadow: [
            BoxShadow(
              color: Color(0x1F0B3D70),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: landingNavLinks
              .map((enlace) => _buildEnlace(enlace, l10n))
              .toList(),
        ),
      ),
    );
  }

  // Enlace del menu desplegable: uno debajo de otro y ocupando todo el
  // ancho para que sea facil de pulsar.
  Widget _buildEnlace(NavLink enlace, AppLocalizations l10n) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: AppColors.texto,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      ),
      child: Text(enlace.texto(l10n)),
    );
  }
}
