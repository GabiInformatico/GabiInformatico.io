import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/view_model/accessibility_view_model.dart';

// Colores de la App
class AppColors {
  const AppColors._({
    required this.azul,
    required this.azulMarca,
    required this.azulMedio,
    required this.azulSuave,
    required this.azulOscuro,
    required this.azulClaro,
    required this.azulNiebla,
    required this.texto,
    required this.textoClaro,
    required this.borde,
    required this.bordeOscuro,
    required this.superficieAlt,
    required this.azulHielo,
    required this.azulPastel,
    required this.blanco,
  });

  // Los 4 tonos oficiales de azul de Osature, de mas oscuro a mas claro.
  final Color azul;
  final Color azulMarca;
  final Color azulMedio;
  final Color azulSuave;

  final Color azulOscuro;
  final Color azulClaro;
  // Fondo casi blanco con un toque de azul, para el degradado del hero.
  final Color azulNiebla;
  final Color texto;
  final Color textoClaro;
  final Color borde;
  final Color bordeOscuro;
  // Fondo gris muy claro para las "lineas" de texto falso de la tarjeta.
  final Color superficieAlt;
  // Azul muy claro para texto sobre fondos oscuros (CTA final).
  final Color azulHielo;
  // Azul apagado para los enlaces del pie, sobre el fondo oscuro.
  final Color azulPastel;
  final Color blanco;

  static const AppColors normal = AppColors._(
    azul: Color(0xFF2067D8),
    azulMarca: Color(0xFF459CEB),
    azulMedio: Color(0xFF7AB8FB),
    azulSuave: Color(0xFFC1DEFF),
    azulOscuro: Color(0xFF0B3D70),
    azulClaro: Color(0xFFEAF3FF),
    azulNiebla: Color(0xFFF4F9FF),
    texto: Color(0xFF17202B),
    textoClaro: Color(0xFF4C5763),
    borde: Color(0xFFDBE4EE),
    bordeOscuro: Color(0xFFB9C9DC),
    superficieAlt: Color(0xFFF6F9FD),
    azulHielo: Color(0xFFE6F0FB),
    azulPastel: Color(0xFFCFE1F6),
    blanco: Colors.white,
  );

  // Alto contraste, con los mismos valores que el body.alto-contraste de
  // los mockups: el texto se va a negro, los azules oscuros se oscurecen
  // mas, los bordes se ven de verdad y los fondos con tinte azul pasan a
  // blanco. Los azules de marca (el anillo, las lineas de la tarjeta) se
  // quedan como estan, igual que en el mockup.
  static const AppColors contraste = AppColors._(
    azul: Color(0xFF0F477F),
    azulMarca: Color(0xFF459CEB),
    azulMedio: Color(0xFF7AB8FB),
    azulSuave: Color(0xFFC1DEFF),
    azulOscuro: Color(0xFF062D54),
    azulClaro: Colors.white,
    azulNiebla: Colors.white,
    texto: Colors.black,
    textoClaro: Color(0xFF14202C),
    borde: Color(0xFF6B7C8F),
    bordeOscuro: Color(0xFF33475B),
    superficieAlt: Colors.white,
    azulHielo: Color(0xFFE6F0FB),
    azulPastel: Color(0xFFCFE1F6),
    blanco: Colors.white,
  );

  // La paleta que toca segun el boton de la barra de accesibilidad.
  static AppColors of(BuildContext context) {
    final viewModel = context.watch<AccessibilityViewModel>();
    return viewModel.altoContraste ? contraste : normal;
  }
}

// Medidas
class AppMedidas {
  static const double radio = 12;
  // Radio mas grande, para tarjetas grandes (la del documento del hero).
  static const double radioGrande = 20;

  static const double anchoMaximo = 1120;

  // Por debajo de este ancho, la cabecera pasa a modo movil (hamburguesa).
  static const double anchoMovil = 760;

  // Por debajo de este ancho, las secciones a dos columnas (el hero...)
  // pasan a una sola columna apilada.
  static const double anchoTablet = 900;
}
