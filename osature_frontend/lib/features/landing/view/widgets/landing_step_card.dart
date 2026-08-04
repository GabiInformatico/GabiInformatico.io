import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../model/landing_step.dart';

// Tarjeta de un paso del bloque "Como funciona": numero, icono, titulo y
// descripcion.
class LandingStepCard extends StatelessWidget {
  const LandingStepCard({super.key, required this.paso, required this.numero});

  final LandingStep paso;
  final int numero;

  static const Map<String, IconData> _iconos = {
    'subir': Icons.upload_outlined,
    'elegir': Icons.checklist_outlined,
    'descargar': Icons.download_outlined,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final estilos = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.blanco,
        border: Border.all(color: AppColors.borde),
        borderRadius: BorderRadius.circular(AppMedidas.radioGrande),
        boxShadow: [
          BoxShadow(
            color: AppColors.azulOscuro.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.azul,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$numero',
              style: estilos.labelSmall?.copyWith(
                color: AppColors.blanco,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Icon(_iconos[paso.id], size: 30, color: AppColors.azul),
          const SizedBox(height: 12),
          Text(paso.titulo(l10n), style: estilos.titleLarge),
          const SizedBox(height: 6),
          SizedBox(
            height: 45,
            child: Text(
              paso.descripcion(l10n),
              style: estilos.bodyMedium?.copyWith(color: AppColors.textoClaro),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
