import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../view_model/accessibility_view_model.dart';

// Barra azul oscura de arriba del todo.
class AccessibilityBar extends StatelessWidget {
  const AccessibilityBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AccessibilityViewModel>();
    final activo = viewModel.altoContraste;
    final l10n = AppLocalizations.of(context);
    final colores = AppColors.of(context);

    return Container(
      color: colores.azulOscuro,
      child: Center(
        child: Container(
          width: AppMedidas.anchoMaximo,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: Row(
            children: [
              const Spacer(),
              // Le digo al lector de pantalla si el boton esta activado.
              Semantics(
                toggled: activo,
                child: _botonContraste(
                  activo,
                  viewModel.cambiarContraste,
                  l10n,
                  Theme.of(context).textTheme,
                  colores,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Cuando esta activo se pone al reves: fondo blanco y letra azul.
  Widget _botonContraste(
    bool activo,
    VoidCallback alPulsar,
    AppLocalizations l10n,
    TextTheme estilos,
    AppColors colores,
  ) {
    return TextButton.icon(
      onPressed: alPulsar,
      icon: const Icon(Icons.contrast, size: 15),
      label: Text(l10n.accesibilidad_alto_contraste),
      style: TextButton.styleFrom(
        foregroundColor: activo ? colores.azulOscuro : colores.blanco,
        backgroundColor: activo ? colores.blanco : Colors.transparent,
        textStyle: estilos.labelMedium,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        minimumSize: const Size(0, 32),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(color: colores.blanco),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
