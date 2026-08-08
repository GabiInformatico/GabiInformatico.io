import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

// Cabecera de un paso: el numero en un circulo, el titulo y, si hace
// falta, un boton a la derecha.
class StepHeader extends StatelessWidget {
  const StepHeader({
    super.key,
    required this.numero,
    required this.titulo,
    this.accion,
  });

  final int numero;
  final String titulo;
  final Widget? accion;

  @override
  Widget build(BuildContext context) {
    final estilos = Theme.of(context).textTheme;
    final colores = AppColors.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Wrap(
        spacing: 12,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colores.azulClaro,
            ),
            child: Text(
              '$numero',
              style: estilos.labelSmall?.copyWith(
                color: colores.azul,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(titulo, style: estilos.titleLarge),
          ?accion,
        ],
      ),
    );
  }
}
