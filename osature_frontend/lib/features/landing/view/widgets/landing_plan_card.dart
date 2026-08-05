import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/view/ghost_button.dart';
import '../../../../shared/view/primary_button.dart';
import '../../model/landing_plan.dart';

// Tarjeta de un plan del bloque "Servicios". El plan destacado lleva
// borde azul, mas sombra y una etiqueta que sobresale por arriba.
class LandingPlanCard extends StatelessWidget {
  const LandingPlanCard({super.key, required this.plan});

  final LandingPlan plan;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final estilos = Theme.of(context).textTheme;

    final tarjeta = Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.blanco,
        borderRadius: BorderRadius.circular(AppMedidas.radioGrande),
        border: Border.all(
          color: plan.destacado ? AppColors.azulMarca : AppColors.borde,
          width: plan.destacado ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.azulOscuro.withValues(
              alpha: plan.destacado ? 0.14 : 0.06,
            ),
            blurRadius: plan.destacado ? 36 : 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(plan.titulo(l10n), style: estilos.titleLarge),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                plan.precio(l10n),
                style: estilos.titleLarge?.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 4),
              Text(l10n.landing_plan_precio_sufijo, style: estilos.bodySmall),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            plan.descripcion(l10n),
            style: estilos.bodyMedium?.copyWith(color: AppColors.textoClaro),
          ),
          const SizedBox(height: 18),
          for (final caracteristica in plan.caracteristicas(l10n))
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check, size: 18, color: AppColors.azul),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(caracteristica, style: estilos.bodyMedium),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: plan.destacado
                ? PrimaryButton(texto: plan.textoBoton(l10n), onPressed: () {})
                : GhostButton(texto: plan.textoBoton(l10n), onPressed: () {}),
          ),
        ],
      ),
    );

    final badge = plan.badge(l10n);
    if (badge == null) return tarjeta;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        tarjeta,
        Positioned(
          top: -13,
          left: 30,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.azul,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              badge,
              style: estilos.labelSmall?.copyWith(color: AppColors.blanco),
            ),
          ),
        ),
      ],
    );
  }
}
