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
      // Boton con texto (enlaces del menu...). El texto ya sale de
      // labelLarge, aqui solo hace falta el color.
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.azul),
      ),
      // Boton relleno de azul (Registrarse, Crear cuenta...).
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.azul,
          foregroundColor: AppColors.blanco,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppMedidas.radio),
          ),
        ),
      ),
      // Boton con borde (Iniciar sesion, Ver como funciona...).
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.azulOscuro,
          side: const BorderSide(color: AppColors.bordeOscuro, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppMedidas.radio),
          ),
        ),
      ),
    );
  }

  static TextTheme textos() {
    return const TextTheme(
      // Titulo grande del hero.
      headlineLarge: TextStyle(
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w700,
        fontSize: 40,
        height: 1.2,
        color: AppColors.azulOscuro,
      ),
      // Titulos de pantalla o de seccion.
      titleLarge: TextStyle(
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w600,
        fontSize: 19,
        height: 1.25,
        color: AppColors.azulOscuro,
      ),
      // Texto de venta / parrafos destacados (subtitulo del hero...).
      bodyLarge: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 19,
        height: 1.5,
        color: AppColors.textoClaro,
      ),
      // Texto normal de la app.
      bodyMedium: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 15,
        height: 1.5,
        color: AppColors.texto,
      ),
      // Notas y texto pequeño de apoyo.
      bodySmall: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 14,
        height: 1.4,
        color: AppColors.textoClaro,
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
    );
  }
}
