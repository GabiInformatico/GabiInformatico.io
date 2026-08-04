import 'package:flutter/material.dart';

// Colores de la App
class AppColors {
  // Los 4 tonos oficiales de azul de Osature, de mas oscuro a mas claro.
  static const Color azul = Color(0xFF2067D8);
  static const Color azulMarca = Color(0xFF459CEB);
  static const Color azulMedio = Color(0xFF7AB8FB);
  static const Color azulSuave = Color(0xFFC1DEFF);

  static const Color azulOscuro = Color(0xFF0B3D70);
  static const Color azulClaro = Color(0xFFEAF3FF);
  // Fondo casi blanco con un toque de azul, para el degradado del hero.
  static const Color azulNiebla = Color(0xFFF4F9FF);
  static const Color texto = Color(0xFF17202B);
  static const Color textoClaro = Color(0xFF4C5763);
  static const Color borde = Color(0xFFDBE4EE);
  static const Color bordeOscuro = Color(0xFFB9C9DC);
  // Fondo gris muy claro para las "lineas" de texto falso de la tarjeta.
  static const Color superficieAlt = Color(0xFFF6F9FD);
  // Azul muy claro para texto sobre fondos oscuros (CTA final).
  static const Color azulHielo = Color(0xFFE6F0FB);
  static const Color blanco = Colors.white;
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
