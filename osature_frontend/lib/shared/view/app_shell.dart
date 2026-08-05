import 'package:flutter/material.dart';

import 'accessibility_bar.dart';

// Envoltorio para las pantallas de la app: pone siempre la barra de
// accesibilidad arriba del todo, para no tener que repetirla en cada
// pantalla nueva que se enlace desde la landing.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AccessibilityBar(),
          Expanded(child: body),
        ],
      ),
    );
  }
}
