import 'package:flutter/material.dart';

import '../../model/adaptation_option.dart';
import 'adaptation_option_card.dart';

// Pone las adaptaciones en dos columnas
class AdaptationGrid extends StatelessWidget {
  const AdaptationGrid({super.key, required this.adaptaciones});

  final List<AdaptationOption> adaptaciones;

  // Hueco entre tarjetas
  static const double hueco = 12;

  // Por debajo de este ancho las tarjetas van en una sola columna.
  static const double anchoDosColumnas = 680;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < anchoDosColumnas) {
          return _buildUnaColumna();
        }
        return _buildDosColumnas();
      },
    );
  }

  Widget _buildUnaColumna() {
    return Column(
      children: [
        for (final adaptacion in adaptaciones)
          Padding(
            padding: const EdgeInsets.only(bottom: hueco),
            child: AdaptationOptionCard(adaptacion: adaptacion),
          ),
      ],
    );
  }

  Widget _buildDosColumnas() {
    final filas = <Widget>[];

    // Voy cogiendo las adaptaciones de dos en dos y hago una fila con
    // cada pareja.
    for (int i = 0; i < adaptaciones.length; i = i + 2) {
      filas.add(
        Padding(
          padding: const EdgeInsets.only(bottom: hueco),
          // Hace que las dos tarjetas esten a la misma altura aunque una tenga mas.
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: AdaptationOptionCard(adaptacion: adaptaciones[i]),
                ),
                const SizedBox(width: hueco),
                // Si la ultima fila se queda coja dejo el hueco vacio, si no
                // la tarjeta se estira ella sola a lo ancho.
                if (i + 1 < adaptaciones.length)
                  Expanded(
                    child: AdaptationOptionCard(
                      adaptacion: adaptaciones[i + 1],
                    ),
                  )
                else
                  const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      );
    }

    return Column(children: filas);
  }
}
