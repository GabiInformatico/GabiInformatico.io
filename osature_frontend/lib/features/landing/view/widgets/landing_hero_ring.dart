import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

// Anillo decorativo con degradado, detras de la tarjeta del documento en
// el hero. Solo es un adorno visual.
class LandingHeroRing extends StatelessWidget {
  const LandingHeroRing({super.key, this.diametro = 300});

  final double diametro;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: SizedBox(
        width: diametro,
        height: diametro,
        child: CustomPaint(painter: _RingPainter()),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centro = size.center(Offset.zero);
    final radioExterior = size.shortestSide / 2;
    // El grosor del anillo es el 40% del radio, para que quede un
    // agujero central del 60%, igual que la mascara del mockup.
    final grosor = radioExterior * 0.4;
    final radioTrazo = radioExterior - grosor / 2;

    final degradado = SweepGradient(
      transform: const GradientRotation(210 * math.pi / 180),
      colors: const [
        AppColors.azulSuave,
        AppColors.azulMedio,
        AppColors.azulMarca,
        AppColors.azulMedio,
        AppColors.azulSuave,
      ],
    );

    final pintura = Paint()
      ..shader = degradado.createShader(
        Rect.fromCircle(center: centro, radius: radioExterior),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = grosor;

    canvas.drawCircle(centro, radioTrazo, pintura);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
