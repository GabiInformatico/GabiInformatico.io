import 'package:flutter/material.dart';

import 'app_colors.dart';

// El tema de la app. Lo pongo en el MaterialApp desde main.dart.
// Todos los estilos de texto salen de aqui (textTheme): en las pantallas
// no se pone font-family ni tamaño a mano, se usa
// Theme.of(context).textTheme.
class AppTheme {
  // Estilo de los botones grandes (hero, CTA final...). Los botones
  // normales ya usan el labelLarge del TextTheme sin necesidad de pisarlo.
  static const TextStyle textoBotonGrande = TextStyle(
    fontFamily: 'Quicksand',
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 1.1,
  );

  static ThemeData build(AppColors colores) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Rubik',
      scaffoldBackgroundColor: colores.blanco,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colores.azul,
        primary: colores.azul,
        surface: colores.blanco,
        onSurface: colores.texto,
      ),
      textTheme: textos(colores),
      // Casilla Tarjetas Adaptaciones.
      checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: colores.bordeOscuro, width: 1.5),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      // Boton con texto (enlaces del menu...). El texto ya sale de
      // labelLarge, aqui solo hace falta el color.
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: colores.azul),
      ),
      // Boton relleno de azul (Registrarse, Crear cuenta...).
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colores.azul,
          foregroundColor: colores.blanco,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppMedidas.radio),
          ),
        ),
      ),
      // Boton con borde (Iniciar sesion, Ver como funciona...).
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colores.azulOscuro,
          side: BorderSide(color: colores.bordeOscuro, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppMedidas.radio),
          ),
        ),
      ),
    );
  }

  static TextTheme textos(AppColors colores) {
    return TextTheme(
      // Titulo grande del hero.
      headlineLarge: TextStyle(
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w700,
        fontSize: 40,
        height: 1.2,
        color: colores.azulOscuro,
      ),
      // Titulo de las secciones (Cómo funciona, Servicios...).
      headlineMedium: TextStyle(
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w700,
        fontSize: 34,
        height: 1.2,
        color: colores.azulOscuro,
      ),
      // Titulos de pantalla o de seccion.
      titleLarge: TextStyle(
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w600,
        fontSize: 19,
        height: 1.25,
        color: colores.azulOscuro,
      ),
      // Titulos pequeños dentro de tarjetas (nombre de archivo...).
      titleMedium: TextStyle(
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 1.3,
        color: colores.azulOscuro,
      ),
      // Etiqueta pequeña en mayusculas encima de un titulo de seccion.
      titleSmall: TextStyle(
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w900,
        fontSize: 13,
        letterSpacing: 1,
        color: colores.azul,
      ),
      // Texto de venta / parrafos destacados (subtitulo del hero...).
      bodyLarge: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 19,
        height: 1.5,
        color: colores.textoClaro,
      ),
      // Texto normal de la app.
      bodyMedium: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 15,
        height: 1.5,
        color: colores.texto,
      ),
      // Notas y texto pequeño de apoyo.
      bodySmall: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 14,
        height: 1.4,
        color: colores.textoClaro,
      ),
      // Texto de los botones grandes de accion (Registrarse, CTAs...).
      labelLarge: TextStyle(
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 1.1,
      ),
      // Texto de botones pequeños/utilitarios (alto contraste...).
      labelMedium: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.2,
      ),
      // Texto de los chips (Texto simplificado, Espaciado ampliado...).
      labelSmall: TextStyle(
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: colores.azulOscuro,
      ),
    );
  }
}
