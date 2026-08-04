import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/primary_button.dart';

// Ultimo bloque antes del pie: fondo con degradado, titulo y boton
// destacado en blanco (invertido respecto al boton normal) para animar a
// crear una cuenta.
class LandingCtaFinal extends StatelessWidget {
  const LandingCtaFinal({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final estilos = Theme.of(context).textTheme;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.azulOscuro, AppColors.azul],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.landing_cta_final_titulo,
                style: estilos.headlineMedium?.copyWith(
                  color: AppColors.blanco,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Text(
                  l10n.landing_cta_final_subtitulo,
                  style: estilos.bodyLarge?.copyWith(
                    color: AppColors.azulHielo,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 28),
              PrimaryButton(
                texto: l10n.landing_hero_cta_primario,
                onPressed: () {},
                grande: true,
                colorFondo: AppColors.blanco,
                colorTexto: AppColors.azul,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
