import 'package:flutter/material.dart';

import '../../../shared/layout/app_shell.dart';
import 'widgets/landing_cta_final.dart';
import 'widgets/landing_header.dart';
import 'widgets/landing_hero.dart';
import 'widgets/landing_how_it_works.dart';
import 'widgets/landing_mobile_menu.dart';
import 'widgets/landing_services.dart';

// Pantalla de la landing publica de Osature.
// Las secciones se van añadiendo bloque a bloque dentro de la columna
// con scroll.
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      // El Stack envuelve todo el contenido con scroll para que el menu
      // movil (ultimo hijo) se pinte siempre por encima, sin que las
      // secciones que vienen despues lo tapen.
      body: Stack(
        clipBehavior: Clip.none,
        children: const [
          SingleChildScrollView(
            child: Column(
              children: [
                LandingHeader(),
                LandingHero(),
                LandingHowItWorks(),
                LandingServices(),
                LandingCtaFinal(),
              ],
            ),
          ),
          LandingMobileMenu(),
        ],
      ),
    );
  }
}
