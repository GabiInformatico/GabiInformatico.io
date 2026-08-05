import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/view/section_heading.dart';
import '../../model/landing_plan.dart';
import 'landing_plan_card.dart';

// Bloque "Servicios": cabecera de seccion y las tarjetas de los planes,
// una al lado de otra (o apiladas en pantallas estrechas).
class LandingServices extends StatelessWidget {
  const LandingServices({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final tarjetas = [
      for (final plan in landingPlans) LandingPlanCard(plan: plan),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.superficieAlt,
        border: Border.symmetric(
          horizontal: BorderSide(color: AppColors.borde),
        ),
      ),
      child: Center(
        child: Container(
          width: AppMedidas.anchoMaximo,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 76),
          child: Column(
            children: [
              SectionHeading(
                eyebrow: l10n.landing_servicios_eyebrow,
                titulo: l10n.landing_servicios_titulo,
                subtitulo: l10n.landing_servicios_subtitulo,
              ),
              const SizedBox(height: 44),
              // El LayoutBuilder va FUERA del ConstrainedBox de 820: si
              // estuviera dentro, el ancho que veria nunca pasaria de
              // 820 y la seccion se quedaria siempre apilada, aunque la
              // pantalla fuera enorme.
              LayoutBuilder(
                builder: (context, constraints) {
                  final apilado = constraints.maxWidth < AppMedidas.anchoTablet;

                  final contenido = apilado
                      ? Column(
                          children: [
                            tarjetas[0],
                            const SizedBox(height: 24),
                            tarjetas[1],
                          ],
                        )
                      // IntrinsicHeight para que las dos tarjetas queden a
                      // la misma altura (stretch necesita altura concreta
                      // dentro de un scroll, que da altura infinita).
                      : IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: tarjetas[0]),
                              const SizedBox(width: 24),
                              Expanded(child: tarjetas[1]),
                            ],
                          ),
                        );

                  return Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 820),
                      child: contenido,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
