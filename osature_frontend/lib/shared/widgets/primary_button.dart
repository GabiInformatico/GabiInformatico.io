import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

// Boton relleno de azul, el de mas peso (Registrarse, Crear cuenta...).
// El color, la forma y el texto normal salen de elevatedButtonTheme y del
// TextTheme (AppTheme). Aqui solo se ajusta el tamaño para la variante
// [grande], usada en el hero y otros CTA destacados.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.grande = false,
  });

  final String texto;
  final VoidCallback onPressed;
  final bool grande;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: grande ? 28 : 20,
          vertical: grande ? 15 : 11,
        ),
        textStyle: grande ? AppTheme.textoBotonGrande : null,
      ),
      child: Text(texto),
    );
  }
}
