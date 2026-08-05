import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// El logo de Osature (sin el texto debajo).
class OsatureLogo extends StatelessWidget {
  const OsatureLogo({super.key, this.height = 38});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo_sense_text.svg',
      height: height,
    );
  }
}
