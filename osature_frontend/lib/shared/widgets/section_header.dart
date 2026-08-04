import 'package:flutter/material.dart';

// Cabecera centrada de una seccion: etiqueta pequeña, titulo y texto de
// apoyo. Se repite en varias secciones de la landing (Cómo funciona,
// Servicios...), asi que va aqui para no duplicarla.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
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
