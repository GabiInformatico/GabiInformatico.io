import 'package:flutter/material.dart';

import 'landing_document_card.dart';
import 'landing_hero_ring.dart';

// Ilustracion decorativa del hero: el anillo con degradado detras de la
// tarjeta que simula un documento adaptado. No aporta informacion nueva
// (es lo mismo que ya dice el texto), asi que se excluye del lector de
// pantalla.
class LandingHeroIllustration extends StatelessWidget {
  const LandingHeroIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 360),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Positioned(top: -10, right: -30, child: LandingHeroRing()),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: LandingDocumentCard(),
            ),
          ],
        ),
      ),
    );
  }
}
