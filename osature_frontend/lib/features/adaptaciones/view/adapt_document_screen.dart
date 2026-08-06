import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/view/accessibility_bar.dart';
import '../model/adaptation_option.dart';
import 'widgets/adaptation_grid.dart';

// Pantalla para adaptar un documento.
// De momento solo tiene las barras de arriba y la lista de adaptaciones.
class AdaptDocumentScreen extends StatelessWidget {
  const AdaptDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final estilos = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          // Las dos barras se quedan fijas arriba, no bajan al hacer scroll.
          const AccessibilityBar(),
          _buildMenu(context),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: AppMedidas.anchoMaximo,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 34,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // El titulo de la pagina es el mismo estilo de siempre
                      // pero mas grande.
                      Text(
                        'Adaptar un documento',
                        style: estilos.titleLarge?.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text('Elige las adaptaciones', style: estilos.titleLarge),
                      const SizedBox(height: 16),
                      AdaptationGrid(adaptaciones: adaptationOptions),
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

  // Barra blanca con el nombre, las patnallas y el usuario
  Widget _buildMenu(BuildContext context) {
    final estilos = Theme.of(context).textTheme;
    final colores = AppColors.of(context);

    return Container(
      decoration: BoxDecoration(
        color: colores.blanco,
        border: Border(bottom: BorderSide(color: colores.borde)),
      ),
      child: Center(
        child: Container(
          width: AppMedidas.anchoMaximo,
          height: 68,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text('Osature', style: estilos.titleLarge),
              const SizedBox(width: 32),
              _buildEnlace('Adaptar', true, colores),
              _buildEnlace('Consejos', false, colores),
              _buildEnlace('Mis perfiles', false, colores),
              const Spacer(),
              Text('Hola', style: estilos.bodyMedium),
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 18,
                backgroundColor: colores.azulClaro,
                child: Text('A', style: estilos.titleLarge),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Un enlace del menu. El de la pagina en la que estamos lleva fondo azul.
  Widget _buildEnlace(String texto, bool esLaPaginaActual, AppColors colores) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: esLaPaginaActual ? colores.azulClaro : null,
        foregroundColor: esLaPaginaActual
            ? colores.azulOscuro
            : colores.textoClaro,
      ),
      child: Text(texto),
    );
  }
}
