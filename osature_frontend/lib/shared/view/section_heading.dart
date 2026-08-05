import 'package:flutter/material.dart';

// Cabecera centrada de una seccion de contenido: etiqueta pequeña,
// titulo y texto de apoyo (no confundir con AppHeader, que es la barra
// de navegacion de arriba del todo).
class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.eyebrow,
    required this.titulo,
    required this.subtitulo,
  });

  final String eyebrow;
  final String titulo;
  final String subtitulo;

  @override
  Widget build(BuildContext context) {
    final estilos = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 640),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            eyebrow.toUpperCase(),
            style: estilos.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            titulo,
            style: estilos.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            subtitulo,
            style: estilos.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
