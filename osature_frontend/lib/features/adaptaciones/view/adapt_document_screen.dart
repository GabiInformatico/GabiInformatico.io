import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/view/app_session_header.dart';
import '../../../shared/view/app_shell.dart';
import '../model/adaptation_option.dart';
import '../model/saved_profile.dart';
import '../view_model/adapt_document_viewmodel.dart';
import 'widgets/adaptation_grid.dart';
import 'widgets/output_panel.dart';
import 'widgets/step_header.dart';
import 'widgets/upload_zone.dart';

// Pantalla para adaptar un documento: se sube el archivo y se eligen las
// adaptaciones. Falta el panel de la derecha (formato y resumen).
class AdaptDocumentScreen extends StatelessWidget {
  const AdaptDocumentScreen({super.key});

  // Ancho del panel de la derecha.
  static const double anchoPanel = 330;

  @override
  Widget build(BuildContext context) {
    return AppShell(
      body: Column(
        children: [
          // La cabecera se queda fija arriba, no baja al hacer scroll.
          const AppSessionHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: AppMedidas.anchoMaximo,
                  padding: const EdgeInsets.fromLTRB(24, 34, 24, 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitulo(context),
                      const SizedBox(height: 30),
                      _buildDisposicion(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Los pasos a la izquierda y el panel del formato a la derecha. En
  // pantallas estrechas el panel baja debajo de los pasos.
  Widget _buildDisposicion(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final apilado = constraints.maxWidth < AppMedidas.anchoTablet;

        if (apilado) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPasos(context),
              const SizedBox(height: 28),
              const OutputPanel(),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildPasos(context)),
            const SizedBox(width: 40),
            const SizedBox(width: anchoPanel, child: OutputPanel()),
          ],
        );
      },
    );
  }

  Widget _buildPasos(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const StepHeader(numero: 1, titulo: 'Sube tu documento'),
        const UploadZone(),
        const SizedBox(height: 34),
        StepHeader(
          numero: 2,
          titulo: 'Elige las adaptaciones',
          accion: _buildCargarPerfil(context),
        ),
        const AdaptationGrid(adaptaciones: adaptationOptions),
      ],
    );
  }

  // El titulo de la pagina es el mismo estilo de siempre pero mas grande.
  Widget _buildTitulo(BuildContext context) {
    final estilos = Theme.of(context).textTheme;
    final colores = AppColors.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Adaptar un documento',
          style: estilos.titleLarge?.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Descripcion de la pantalla',
          style: estilos.bodyMedium?.copyWith(color: colores.textoClaro),
        ),
      ],
    );
  }

  // Desplegable con los perfiles guardados. De momento elegir uno solo se
  // queda apuntado, no marca ninguna adaptacion.
  Widget _buildCargarPerfil(BuildContext context) {
    final estilos = Theme.of(context).textTheme;
    final colores = AppColors.of(context);
    final viewModel = context.watch<AdaptDocumentViewModel>();

    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: colores.blanco,
        border: Border.all(color: colores.bordeOscuro, width: 1.5),
        borderRadius: BorderRadius.circular(AppMedidas.radio),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: viewModel.perfil,
          hint: Text('Cargar perfil', style: estilos.labelLarge),
          icon: Icon(Icons.expand_more, color: colores.azulOscuro),
          style: estilos.labelLarge?.copyWith(color: colores.azulOscuro),
          borderRadius: BorderRadius.circular(AppMedidas.radio),
          items: [
            for (final perfil in savedProfiles)
              DropdownMenuItem(value: perfil.id, child: Text(perfil.nombre)),
          ],
          onChanged: viewModel.elegirPerfil,
        ),
      ),
    );
  }
}
