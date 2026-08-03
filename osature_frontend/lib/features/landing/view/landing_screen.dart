import 'package:flutter/material.dart';

import '../../../shared/accessibility/accessibility_bar.dart';
import 'widgets/landing_header.dart';
import 'widgets/landing_mobile_menu.dart';

// Pantalla de la landing publica de Osature.
// De momento solo tiene las barras de arriba; las demas secciones se
// iran añadiendo bloque a bloque.
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AccessibilityBar(),
          // Stack para que el menu movil se pinte encima de la cabecera
          // sin desplazarla. Cuando añadamos mas secciones debajo, este
          // Stack tendra que envolverlas tambien para que el desplegable
          // siga tapandolas correctamente.
          Stack(
            clipBehavior: Clip.none,
            children: const [LandingHeader(), LandingMobileMenu()],
          ),
        ],
      ),
    );
  }
}
