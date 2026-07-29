import 'package:flutter/material.dart';

import 'app_colors.dart';

// El tema de la app. Lo pongo en el MaterialApp desde main.dart.
class AppTheme {
  // Estilo del texto de los botones.
  static const TextStyle textoBoton = TextStyle(
    fontFamily: 'Quicksand',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.1,
  );

  static ThemeData build() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Rubik',
      scaffoldBackgroundColor: AppColors.blanco,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.azul,
        primary: AppColors.azul,
        surface: AppColors.blanco,
        onSurface: AppColors.texto,
      ),
      textTheme: textos(),
      // Casilla Tarjetas Adaptaciones.
      checkboxTheme: const CheckboxThemeData(
        side: BorderSide(color: AppColors.bordeOscuro, width: 1.5),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      // Boton con texto.
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.azul,
          textStyle: textoBoton,
        ),
      ),
    );
  }


  static TextTheme textos() {
    return const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w600,
        fontSize: 19,
        height: 1.25,
        color: AppColors.azulOscuro,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 15,
        height: 1.5,
        color: AppColors.texto,
      ),
    );
  }
}
