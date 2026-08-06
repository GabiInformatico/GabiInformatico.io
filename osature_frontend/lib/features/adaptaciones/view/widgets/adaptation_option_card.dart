import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../../model/adaptation_option.dart';
import '../../view_model/adapt_document_viewmodel.dart';

// Tarjeta de una adaptacion, con su casilla, su nombre y su explicacion.
// Se puede pulsar en toda la tarjeta, no hace falta darle a la casilla.
class AdaptationOptionCard extends StatelessWidget {
  const AdaptationOptionCard({super.key, required this.adaptacion});

  final AdaptationOption adaptacion;

  @override
  Widget build(BuildContext context) {
    final estilos = Theme.of(context).textTheme;
    final viewModel = context.watch<AdaptDocumentViewModel>();
    final marcada = viewModel.estaMarcada(adaptacion.id);
    final colores = AppColors.of(context);

    return MergeSemantics(
      child: InkWell(
        onTap: () {
          viewModel.marcarAdaptacion(adaptacion.id, !marcada);
        },
        excludeFromSemantics: true,
        borderRadius: BorderRadius.circular(AppMedidas.radio),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            // Cuando esta marcada se pone azul clarito.
            color: marcada ? colores.azulClaro : colores.blanco,
            borderRadius: BorderRadius.circular(AppMedidas.radio),
            border: Border.all(
              color: marcada ? colores.azul : colores.borde,
              width: 1.5,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: marcada,
                onChanged: (valor) {
                  viewModel.marcarAdaptacion(adaptacion.id, valor ?? false);
                },
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      adaptacion.title,
                      style: estilos.bodyMedium?.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (adaptacion.description != '')
                      Text(
                        adaptacion.description,
                        style: estilos.bodyMedium?.copyWith(
                          fontSize: 14,
                          color: colores.textoClaro,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
