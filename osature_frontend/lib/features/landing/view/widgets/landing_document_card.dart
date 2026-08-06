import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

// Tarjeta falsa que simula un documento ya adaptado (icono, nombre,
// "lineas" de texto y chips de las adaptaciones aplicadas). Es la pieza
// central de la ilustracion del hero.
class LandingDocumentCard extends StatelessWidget {
  const LandingDocumentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final estilos = Theme.of(context).textTheme;
    final colores = AppColors.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: colores.blanco,
          border: Border.all(color: colores.borde),
          borderRadius: BorderRadius.circular(AppMedidas.radioGrande),
          boxShadow: [
            BoxShadow(
              color: colores.azulOscuro.withValues(alpha: 0.12),
              blurRadius: 40,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colores.azulClaro,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.insert_drive_file_outlined,
                    size: 20,
                    color: colores.azul,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.landing_hero_ilustracion_archivo,
                        style: estilos.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        l10n.landing_hero_ilustracion_descripcion,
                        style: estilos.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _linea(colores, ancho: 0.9, destacada: true),
            _linea(colores, ancho: 0.7),
            _linea(colores, ancho: 0.9),
            _linea(colores, ancho: 0.5, destacada: true),
            _linea(colores, ancho: 0.7),
            const SizedBox(height: 18),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _chip(
                  l10n.landing_hero_chip_texto_simplificado,
                  estilos,
                  colores,
                ),
                _chip(
                  l10n.landing_hero_chip_espaciado_ampliado,
                  estilos,
                  colores,
                ),
                _chip(
                  l10n.landing_hero_chip_lectura_voz_alta,
                  estilos,
                  colores,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Una "linea" de texto falso. Las destacadas simulan una palabra
  // resaltada dentro del texto adaptado.
  Widget _linea(
    AppColors colores, {
    required double ancho,
    bool destacada = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.5),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: ancho,
        child: Container(
          height: 12,
          decoration: BoxDecoration(
            color: destacada ? colores.azulSuave : colores.superficieAlt,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  Widget _chip(String texto, TextTheme estilos, AppColors colores) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: colores.azulClaro,
        border: Border.all(color: colores.azulSuave),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(texto, style: estilos.labelSmall),
    );
  }
}
