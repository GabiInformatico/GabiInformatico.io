import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../model/footer_link_group.dart';
import 'osature_logo_sense_text.dart';

// Pie comun a todas las pantallas: logo + redes, columnas de enlaces y
// la barra legal de abajo del todo con el copyright.
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final estilos = Theme.of(context).textTheme;
    final colores = AppColors.of(context);

    return Container(
      color: colores.azulOscuro,
      child: Center(
        child: Container(
          width: AppMedidas.anchoMaximo,
          padding: const EdgeInsets.fromLTRB(24, 56, 24, 28),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final apilado = constraints.maxWidth < AppMedidas.anchoTablet;

                  if (apilado) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _marca(l10n, estilos, colores),
                        const SizedBox(height: 32),
                        for (final grupo in footerLinkGroups) ...[
                          _columnaEnlaces(grupo, l10n, estilos, colores),
                          const SizedBox(height: 32),
                        ],
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 7, child: _marca(l10n, estilos, colores)),
                      const SizedBox(width: 32),
                      Expanded(
                        flex: 5,
                        child: _columnaEnlaces(
                          footerLinkGroups[0],
                          l10n,
                          estilos,
                          colores,
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        flex: 5,
                        child: _columnaEnlaces(
                          footerLinkGroups[1],
                          l10n,
                          estilos,
                          colores,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 40),
              _legal(l10n, estilos, colores),
            ],
          ),
        ),
      ),
    );
  }

  // Logo arriba y redes sociales debajo, centrados entre si (el que sea
  // mas ancho de los dos manda, y el otro se centra respecto a el).
  Widget _marca(AppLocalizations l10n, TextTheme estilos, AppColors colores) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const OsatureLogo(height: 30),
        const SizedBox(height: 14),
        Semantics(
          label: l10n.landing_footer_redes_label,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _redSocial(
                FontAwesomeIcons.tiktok,
                l10n.landing_footer_red_tiktok,
                colores,
              ),
              const SizedBox(width: 12),
              _redSocial(
                FontAwesomeIcons.instagram,
                l10n.landing_footer_red_instagram,
                colores,
              ),
              const SizedBox(width: 12),
              _redSocial(
                FontAwesomeIcons.envelope,
                l10n.landing_footer_red_correo,
                colores,
              ),
              const SizedBox(width: 12),
              _redSocial(
                FontAwesomeIcons.linkedin,
                l10n.landing_footer_red_linkedin,
                colores,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Boton circular de una red social, con el logo real de cada una.
  Widget _redSocial(FaIconData icono, String etiqueta, AppColors colores) {
    return Tooltip(
      message: etiqueta,
      child: InkWell(
        onTap: () {},
        customBorder: const CircleBorder(),
        child: Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colores.blanco.withValues(alpha: 0.3)),
          ),
          child: FaIcon(icono, size: 15, color: colores.azulPastel),
        ),
      ),
    );
  }

  // Una columna de enlaces (Producto o Recursos).
  Widget _columnaEnlaces(
    FooterLinkGroup grupo,
    AppLocalizations l10n,
    TextTheme estilos,
    AppColors colores,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          grupo.titulo(l10n),
          style: estilos.titleMedium?.copyWith(
            color: colores.blanco,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 14),
        for (final enlace in grupo.enlaces)
          Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: InkWell(
              onTap: () {},
              child: Text(
                enlace.texto(l10n),
                style: estilos.bodyMedium?.copyWith(color: colores.azulPastel),
              ),
            ),
          ),
      ],
    );
  }

  // Barra de abajo del todo: copyright y enlaces legales. Wrap para que
  // en pantallas estrechas los enlaces bajen debajo del copyright en vez
  // de desbordar.
  Widget _legal(AppLocalizations l10n, TextTheme estilos, AppColors colores) {
    final estiloLegal = estilos.bodySmall?.copyWith(
      color: colores.azulPastel.withValues(alpha: 0.8),
    );

    return Container(
      padding: const EdgeInsets.only(top: 22),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colores.blanco.withValues(alpha: 0.16)),
        ),
      ),
      // SizedBox a todo el ancho: un Wrap no se estira solo, y sin ancho
      // de sobra el spaceBetween no tiene hueco que repartir.
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 12,
          children: [
            Text(
              '© ${DateTime.now().year} ${l10n.osature}. ${l10n.lectura_accesible}.',
              style: estiloLegal,
            ),
            Wrap(
              spacing: 18,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(l10n.landing_footer_terminos, style: estiloLegal),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    l10n.landing_footer_privacidad,
                    style: estiloLegal,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(l10n.landing_footer_cookies, style: estiloLegal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
