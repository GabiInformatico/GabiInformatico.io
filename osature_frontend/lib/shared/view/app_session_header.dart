import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import 'osature_logo_sense_text.dart';

// Cabecera de las pantallas de dentro de la app (no la publica): logo,
// menu de secciones y el usuario. El enlace de la pantalla en la que
// estamos se marca comparando con la ruta actual.
class AppSessionHeader extends StatelessWidget {
  const AppSessionHeader({super.key});

  // La ruta se deja a null mientras esa pantalla no exista: el enlace se
  // ve pero todavia no lleva a ningun sitio.
  static const List<({String texto, String? ruta})> _secciones = [
    (texto: 'Adaptar', ruta: '/adaptaciones'),
    (texto: 'Consejos', ruta: null),
    (texto: 'Mis perfiles', ruta: null),
  ];

  // Por debajo de este ancho se esconden el menu y el nombre.
  static const double _anchoMenu = 680;

  @override
  Widget build(BuildContext context) {
    final colores = AppColors.of(context);
    final rutaActual = GoRouterState.of(context).matchedLocation;

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
          child: LayoutBuilder(
            builder: (context, constraints) {
              final estrecha = constraints.maxWidth < _anchoMenu;

              return Row(
                children: [
                  InkWell(
                    onTap: () => context.go('/'),
                    child: const OsatureLogo(height: 36),
                  ),
                  const SizedBox(width: 24),
                  if (!estrecha)
                    for (final seccion in _secciones)
                      _buildEnlace(
                        context,
                        seccion.texto,
                        seccion.ruta,
                        seccion.ruta == rutaActual,
                        colores,
                      ),
                  const Spacer(),
                  _buildUsuario(context, estrecha, colores),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // Enlace de una seccion. El de la pantalla actual va con fondo.
  Widget _buildEnlace(
    BuildContext context,
    String texto,
    String? ruta,
    bool esLaPaginaActual,
    AppColors colores,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: TextButton(
        onPressed: () => ruta == null ? null : context.go(ruta),
        style: TextButton.styleFrom(
          backgroundColor: esLaPaginaActual ? colores.azulClaro : null,
          foregroundColor: esLaPaginaActual
              ? colores.azulOscuro
              : colores.textoClaro,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(texto),
      ),
    );
  }

  // Saludo, inicial del usuario y salir.
  Widget _buildUsuario(BuildContext context, bool estrecha, AppColors colores) {
    final estilos = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!estrecha) ...[
          Text('Hola, usuario', style: estilos.bodyMedium),
          const SizedBox(width: 10),
        ],
        Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colores.azulClaro,
            border: Border.all(color: colores.azulSuave),
          ),
          child: Text(
            'U',
            style: estilos.titleMedium?.copyWith(color: colores.azul),
          ),
        ),
        const SizedBox(width: 4),
        TextButton(
          onPressed: () => context.go('/'),
          child: const Text('Salir'),
        ),
      ],
    );
  }
}
