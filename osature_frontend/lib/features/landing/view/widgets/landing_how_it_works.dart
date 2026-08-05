import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/view/section_heading.dart';
import '../../model/landing_step.dart';
import 'landing_step_card.dart';

// Bloque "Como funciona": cabecera de seccion y los 3 pasos en fila (o
// apilados en pantallas estrechas).
class LandingHowItWorks extends StatelessWidget {
  const LandingHowItWorks({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final tarjetas = [
      for (final entrada in landingSteps.asMap().entries)
        LandingStepCard(paso: entrada.value, numero: entrada.key + 1),
    ];

    return Center(
      child: Container(
        width: AppMedidas.anchoMaximo,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 76),
        child: Column(
          children: [
            SectionHeading(
              eyebrow: l10n.landing_como_funciona_eyebrow,
              titulo: l10n.landing_como_funciona_titulo,
              subtitulo: l10n.landing_como_funciona_subtitulo,
            ),
            const SizedBox(height: 44),
            LayoutBuilder(
              builder: (context, constraints) {
                final apilado = constraints.maxWidth < AppMedidas.anchoTablet;

                if (apilado) {
                  // stretch: sin esto cada tarjeta se encoge a su ancho
                  // natural (el texto no envuelve en varias lineas) en
                  // vez de ocupar todo el ancho disponible, y la que
                  // tiene el texto mas largo sale mas ancha que las demas.
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      tarjetas[0],
                      const SizedBox(height: 24),
                      tarjetas[1],
                      const SizedBox(height: 24),
                      tarjetas[2],
                    ],
                  );
                }

                // IntrinsicHeight para que crossAxisAlignment.stretch tenga
                // una altura concreta a la que estirarse: el Row esta
                // dentro de un scroll vertical, que da altura infinita.
                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: tarjetas[0]),
                      const SizedBox(width: 24),
                      Expanded(child: tarjetas[1]),
                      const SizedBox(width: 24),
                      Expanded(child: tarjetas[2]),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
