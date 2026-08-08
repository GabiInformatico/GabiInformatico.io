import 'package:flutter/material.dart';

// Un formato de salida del documento adaptado.
class OutputFormat {
  const OutputFormat({
    required this.id,
    required this.nombre,
    required this.icono,
  });

  final String id;
  final String nombre;
  final IconData icono;
}

/// Formatos disponibles.
const List<OutputFormat> outputFormats = [
  OutputFormat(id: 'pdf', nombre: 'PDF', icono: Icons.picture_as_pdf_outlined),
  OutputFormat(id: 'word', nombre: 'Word', icono: Icons.description_outlined),
  OutputFormat(id: 'audio', nombre: 'Audio', icono: Icons.volume_up_outlined),
];
