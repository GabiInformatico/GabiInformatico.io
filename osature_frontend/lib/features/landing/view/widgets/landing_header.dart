import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/ghost_button.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../model/nav_link.dart';
import '../../view_model/landing_view_model.dart';

// Cabecera de la landing: logo, menu y botones de acceso.
// En pantallas estrechas el menu de enlaces se esconde detras de una
// hamburguesa (ver LandingMobileMenu para el desplegable).
class LandingHeader extends StatelessWidget {
  const LandingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.blanco,
        border: Border(bottom: BorderSide(color: AppColors.borde)),
      ),
      child: Center(
        child: Container(
          width: AppMedidas.anchoMaximo,
          height: 74,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final esMovil = constraints.maxWidth < AppMedidas.anchoMovil;
              return esMovil
                  ? _cabeceraMovil(context, l10n)
                  : _cabeceraEscritorio(l10n);
            },
          ),
        ),
      ),
    );
  }

  // Logo a la izquierda, menu en medio y botones a la derecha, igual que
  // en el mockup (nav con justify-content: space-between).
  Widget _cabeceraEscritorio(AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logo_sense_text(),
        // Flexible + scroll horizontal: si el menu no cabe entero por muy
        // poco, se desliza en vez de desbordar.
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: landingNavLinks
                  .map((enlace) => _buildEnlace(enlace, l10n))
                  .toList(),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GhostButton(texto: l10n.landing_iniciar_sesion, onPressed: () {}),
            const SizedBox(width: 10),
            PrimaryButton(texto: l10n.landing_registrarse, onPressed: () {}),
          ],
        ),
      ],
    );
  }

  // En movil los enlaces se esconden: solo se ve el logo, el boton de
  // registrarse y la hamburguesa que abre el menu desplegable.
  Widget _cabeceraMovil(BuildContext context, AppLocalizations l10n) {
    final viewModel = context.watch<LandingViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logo_sense_text(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(texto: l10n.landing_registrarse, onPressed: () {}),
            const SizedBox(width: 10),
            _buildHamburguesa(viewModel, l10n),
          ],
        ),
      ],
    );
  }

  Widget _logo_sense_text() {
    return Image.asset('assets/images/logo_sense_text.png', height: 38);
  }

  // Boton cuadrado con el icono de hamburguesa (o de cerrar si ya esta
  // abierto) que alterna el menu desplegable.
  Widget _buildHamburguesa(LandingViewModel viewModel, AppLocalizations l10n) {
    final abierto = viewModel.menuAbierto;
    return Semantics(
      button: true,
      toggled: abierto,
      label: abierto ? l10n.landing_cerrar_menu : l10n.landing_abrir_menu,
      child: InkWell(
        onTap: viewModel.alternarMenu,
        excludeFromSemantics: true,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.bordeOscuro, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(abierto ? Icons.close : Icons.menu, size: 22),
        ),
      ),
    );
  }

  // Enlace de texto del menu, sin fondo.
  Widget _buildEnlace(NavLink enlace, AppLocalizations l10n) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(foregroundColor: AppColors.textoClaro),
      child: Text(enlace.texto(l10n)),
    );
  }
}
