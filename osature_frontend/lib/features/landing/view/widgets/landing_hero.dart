import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/view/ghost_button.dart';
import '../../../../shared/view/primary_button.dart';
import 'landing_hero_illustration.dart';

// Bloque grande de arriba del todo: texto de venta a la izquierda e
// ilustracion del documento a la derecha. En pantallas estrechas se
// apilan, texto primero.
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              final apilado = constraints.maxWidth < AppMedidas.anchoTablet;
              final texto = _textoHero(l10n, estilos);

              if (apilado) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    texto,
                    const SizedBox(height: 36),
                    const LandingHeroIllustration(),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1.05fr / .95fr del mockup, en enteros para el flex.
                  Expanded(flex: 21, child: texto),
                  const SizedBox(width: 48),
                  const Expanded(flex: 19, child: LandingHeroIllustration()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // Titulo, subtitulo, botones y nota. Es la mitad izquierda del hero en
  // escritorio, y va arriba del todo cuando se apila en movil.
  Widget _textoHero(AppLocalizations l10n, TextTheme estilos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(l10n.landing_hero_titulo, style: estilos.headlineLarge),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Text(l10n.landing_hero_subtitulo, style: estilos.bodyLarge),
        ),
        const SizedBox(height: 30),
        // Wrap en vez de Row: si no caben los dos botones en una linea
        // (pantalla estrecha), el segundo pasa a la de abajo en vez de
        // desbordar.
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
              child: Text(l10n.landing_hero_nota, style: estilos.bodySmall),
            ),
          ],
        ),
      ],
    );
  }
}
