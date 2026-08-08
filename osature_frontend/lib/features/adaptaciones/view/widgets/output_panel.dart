import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../../model/output_format.dart';
import '../../view_model/adapt_document_viewmodel.dart';

// Panel de la derecha, donde se elige en que formato se quiere el
// documento adaptado. Falta el resumen y los botones.
class OutputPanel extends StatelessWidget {
  const OutputPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final estilos = Theme.of(context).textTheme;
    final colores = AppColors.of(context);
    final viewModel = context.watch<AdaptDocumentViewModel>();

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: colores.azulNiebla,
        border: Border.all(color: colores.borde),
        borderRadius: BorderRadius.circular(AppMedidas.radioGrande),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Formato de salida', style: estilos.titleLarge),
          const SizedBox(height: 14),
          // El RadioGroup es quien lleva el formato elegido: las bolitas
          // de dentro solo dicen que valor son.
          Semantics(
            label: 'Formato del documento adaptado',
            child: RadioGroup<String>(
              groupValue: viewModel.formato,
              onChanged: (valor) {
                if (valor != null) viewModel.cambiarFormato(valor);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final formato in outputFormats)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _buildFormato(
                        context,
                        formato,
                        viewModel,
                        estilos,
                        colores,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Una fila del grupo. Se puede pulsar en toda la fila, no solo en la
  // bolita.
  Widget _buildFormato(
    BuildContext context,
    OutputFormat formato,
    AdaptDocumentViewModel viewModel,
    TextTheme estilos,
    AppColors colores,
  ) {
    final elegido = viewModel.formato == formato.id;

    return MergeSemantics(
      child: InkWell(
        onTap: () => viewModel.cambiarFormato(formato.id),
        excludeFromSemantics: true,
        borderRadius: BorderRadius.circular(AppMedidas.radio),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: elegido ? colores.azulClaro : colores.blanco,
            border: Border.all(
              color: elegido ? colores.azul : colores.borde,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(AppMedidas.radio),
          ),
          child: Row(
            children: [
              Radio<String>(
                value: formato.id,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              const SizedBox(width: 11),
              Icon(formato.icono, size: 20, color: colores.azul),
              const SizedBox(width: 11),
              Text(formato.nombre, style: estilos.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
