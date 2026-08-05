import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

// Boton con borde y sin relleno (Iniciar sesion, Ver como funciona...).
// El color, el borde y el texto normal salen de outlinedButtonTheme y del
// TextTheme (AppTheme). Aqui solo se ajusta el tamaño para la variante
// [grande], usada en el hero y otros CTA destacados.
class GhostButton extends StatelessWidget {
  const GhostButton({
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
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
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
