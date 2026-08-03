import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/ghost_button.dart';
import '../../../../shared/widgets/primary_button.dart';

// Bloque grande de arriba del todo, con el titulo, el texto de venta y los
// botones de accion. De momento solo el texto: la ilustracion del
// documento (el anillo y la tarjeta con chips) va en un bloque aparte.
class LandingHero extends StatelessWidget {
  const LandingHero({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final estilos = Theme.of(context).textTheme;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.azulNiebla, AppColors.blanco],
          stops: [0, 0.7],
        ),
      ),
      child: Center(
        child: Container(
          width: AppMedidas.anchoMaximo,
          padding: const EdgeInsets.fromLTRB(24, 72, 24, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.landing_hero_titulo, style: estilos.headlineLarge),
              const SizedBox(height: 18),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Text(
                  l10n.landing_hero_subtitulo,
                  style: estilos.bodyLarge,
                ),
              ),
              const SizedBox(height: 30),
              // Wrap en vez de Row: si no caben los dos botones en una
              // linea (pantalla estrecha), el segundo pasa a la de abajo
              // en vez de desbordar.
              Wrap(
                spacing: 14,
                runSpacing: 14,
                children: [
                  PrimaryButton(
                    texto: l10n.landing_hero_cta_primario,
                    onPressed: () {},
                    grande: true,
                  ),
                  GhostButton(
                    texto: l10n.landing_hero_cta_secundario,
                    onPressed: () {},
                    grande: true,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    size: 18,
                    color: AppColors.azul,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      l10n.landing_hero_nota,
                      style: estilos.bodySmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
