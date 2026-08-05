import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ca.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ca'),
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @osature.
  ///
  /// In es, this message translates to:
  /// **'Osature'**
  String get osature;

  /// No description provided for @lectura_accesible.
  ///
  /// In es, this message translates to:
  /// **'Lectura accesible'**
  String get lectura_accesible;

  /// No description provided for @accesibilidad_alto_contraste.
  ///
  /// In es, this message translates to:
  /// **'Alto contraste'**
  String get accesibilidad_alto_contraste;

  /// No description provided for @landing_nav_como_funciona.
  ///
  /// In es, this message translates to:
  /// **'Cómo funciona'**
  String get landing_nav_como_funciona;

  /// No description provided for @landing_nav_servicios.
  ///
  /// In es, this message translates to:
  /// **'Servicios'**
  String get landing_nav_servicios;

  /// No description provided for @landing_nav_preguntas_frecuentes.
  ///
  /// In es, this message translates to:
  /// **'Preguntas frecuentes'**
  String get landing_nav_preguntas_frecuentes;

  /// No description provided for @landing_nav_casos_exito.
  ///
  /// In es, this message translates to:
  /// **'Casos de éxito'**
  String get landing_nav_casos_exito;

  /// No description provided for @landing_nav_blog.
  ///
  /// In es, this message translates to:
  /// **'Blog'**
  String get landing_nav_blog;

  /// No description provided for @landing_iniciar_sesion.
  ///
  /// In es, this message translates to:
  /// **'Iniciar sesión'**
  String get landing_iniciar_sesion;

  /// No description provided for @landing_registrarse.
  ///
  /// In es, this message translates to:
  /// **'Registrarse'**
  String get landing_registrarse;

  /// No description provided for @landing_abrir_menu.
  ///
  /// In es, this message translates to:
  /// **'Abrir menú'**
  String get landing_abrir_menu;

  /// No description provided for @landing_cerrar_menu.
  ///
  /// In es, this message translates to:
  /// **'Cerrar menú'**
  String get landing_cerrar_menu;

  /// No description provided for @landing_hero_titulo.
  ///
  /// In es, this message translates to:
  /// **'Haz que cada documento se adapte a ti'**
  String get landing_hero_titulo;

  /// No description provided for @landing_hero_subtitulo.
  ///
  /// In es, this message translates to:
  /// **'Osature adapta textos, exámenes y fichas de trabajo al formato que mejor se ajusta a cada persona: la letra, el ritmo y los apoyos que necesita.'**
  String get landing_hero_subtitulo;

  /// No description provided for @landing_hero_cta_primario.
  ///
  /// In es, this message translates to:
  /// **'Crear cuenta gratis'**
  String get landing_hero_cta_primario;

  /// No description provided for @landing_hero_cta_secundario.
  ///
  /// In es, this message translates to:
  /// **'Ver cómo funciona'**
  String get landing_hero_cta_secundario;

  /// No description provided for @landing_hero_nota.
  ///
  /// In es, this message translates to:
  /// **'Sin tarjeta, empieza a adaptar en menos de un minuto'**
  String get landing_hero_nota;

  /// No description provided for @landing_hero_ilustracion_archivo.
  ///
  /// In es, this message translates to:
  /// **'ficha_ejercicios.pdf'**
  String get landing_hero_ilustracion_archivo;

  /// No description provided for @landing_hero_ilustracion_descripcion.
  ///
  /// In es, this message translates to:
  /// **'Adaptado para lectura fácil'**
  String get landing_hero_ilustracion_descripcion;

  /// No description provided for @landing_hero_chip_texto_simplificado.
  ///
  /// In es, this message translates to:
  /// **'Texto simplificado'**
  String get landing_hero_chip_texto_simplificado;

  /// No description provided for @landing_hero_chip_espaciado_ampliado.
  ///
  /// In es, this message translates to:
  /// **'Espaciado ampliado'**
  String get landing_hero_chip_espaciado_ampliado;

  /// No description provided for @landing_hero_chip_lectura_voz_alta.
  ///
  /// In es, this message translates to:
  /// **'Resaltado de palabras'**
  String get landing_hero_chip_lectura_voz_alta;

  /// No description provided for @landing_como_funciona_eyebrow.
  ///
  /// In es, this message translates to:
  /// **'Cómo funciona'**
  String get landing_como_funciona_eyebrow;

  /// No description provided for @landing_como_funciona_titulo.
  ///
  /// In es, this message translates to:
  /// **'Tres pasos para un texto accesible'**
  String get landing_como_funciona_titulo;

  /// No description provided for @landing_como_funciona_subtitulo.
  ///
  /// In es, this message translates to:
  /// **'Sin instalar nada. Sube, elige y descarga el documento adaptado en el formato que necesites.'**
  String get landing_como_funciona_subtitulo;

  /// No description provided for @landing_paso_subir_titulo.
  ///
  /// In es, this message translates to:
  /// **'Sube tu documento'**
  String get landing_paso_subir_titulo;

  /// No description provided for @landing_paso_subir_descripcion.
  ///
  /// In es, this message translates to:
  /// **'PDF, Word o una imagen escaneada. Tú eliges qué quieres hacer accesible.'**
  String get landing_paso_subir_descripcion;

  /// No description provided for @landing_paso_elegir_titulo.
  ///
  /// In es, this message translates to:
  /// **'Elige las adaptaciones'**
  String get landing_paso_elegir_titulo;

  /// No description provided for @landing_paso_elegir_descripcion.
  ///
  /// In es, this message translates to:
  /// **'Marca las que necesites o carga un perfil guardado con tu configuración habitual.'**
  String get landing_paso_elegir_descripcion;

  /// No description provided for @landing_paso_descargar_titulo.
  ///
  /// In es, this message translates to:
  /// **'Descarga el resultado'**
  String get landing_paso_descargar_titulo;

  /// No description provided for @landing_paso_descargar_descripcion.
  ///
  /// In es, this message translates to:
  /// **'Recíbelo en PDF o Word. Listo para leer, imprimir o compartir.'**
  String get landing_paso_descargar_descripcion;

  /// No description provided for @landing_servicios_eyebrow.
  ///
  /// In es, this message translates to:
  /// **'Servicios'**
  String get landing_servicios_eyebrow;

  /// No description provided for @landing_servicios_titulo.
  ///
  /// In es, this message translates to:
  /// **'Elige el plan que se ajusta a ti'**
  String get landing_servicios_titulo;

  /// No description provided for @landing_servicios_subtitulo.
  ///
  /// In es, this message translates to:
  /// **'Empieza gratis y pásate a premium cuando necesites más perfiles y documentos.'**
  String get landing_servicios_subtitulo;

  /// No description provided for @landing_plan_precio_sufijo.
  ///
  /// In es, this message translates to:
  /// **'/mes'**
  String get landing_plan_precio_sufijo;

  /// No description provided for @landing_plan_gratis_titulo.
  ///
  /// In es, this message translates to:
  /// **'Cuenta gratuita'**
  String get landing_plan_gratis_titulo;

  /// No description provided for @landing_plan_gratis_precio.
  ///
  /// In es, this message translates to:
  /// **'0 €'**
  String get landing_plan_gratis_precio;

  /// No description provided for @landing_plan_gratis_descripcion.
  ///
  /// In es, this message translates to:
  /// **'Ideal para empezar.'**
  String get landing_plan_gratis_descripcion;

  /// No description provided for @landing_plan_gratis_caracteristica_1.
  ///
  /// In es, this message translates to:
  /// **'Hasta 5 documentos al mes'**
  String get landing_plan_gratis_caracteristica_1;

  /// No description provided for @landing_plan_gratis_caracteristica_2.
  ///
  /// In es, this message translates to:
  /// **'Solo un perfil de configuración'**
  String get landing_plan_gratis_caracteristica_2;

  /// No description provided for @landing_plan_gratis_boton.
  ///
  /// In es, this message translates to:
  /// **'Crear cuenta gratis'**
  String get landing_plan_gratis_boton;

  /// No description provided for @landing_plan_premium_badge.
  ///
  /// In es, this message translates to:
  /// **'Recomendada'**
  String get landing_plan_premium_badge;

  /// No description provided for @landing_plan_premium_titulo.
  ///
  /// In es, this message translates to:
  /// **'Cuenta premium'**
  String get landing_plan_premium_titulo;

  /// No description provided for @landing_plan_premium_precio.
  ///
  /// In es, this message translates to:
  /// **'A definir'**
  String get landing_plan_premium_precio;

  /// No description provided for @landing_plan_premium_descripcion.
  ///
  /// In es, this message translates to:
  /// **'Perfecto para el día a día.'**
  String get landing_plan_premium_descripcion;

  /// No description provided for @landing_plan_premium_caracteristica_1.
  ///
  /// In es, this message translates to:
  /// **'Documentos ilimitados'**
  String get landing_plan_premium_caracteristica_1;

  /// No description provided for @landing_plan_premium_caracteristica_2.
  ///
  /// In es, this message translates to:
  /// **'Múltiples perfiles de configuración'**
  String get landing_plan_premium_caracteristica_2;

  /// No description provided for @landing_plan_premium_boton.
  ///
  /// In es, this message translates to:
  /// **'Empezar con premium'**
  String get landing_plan_premium_boton;

  /// No description provided for @landing_cta_final_titulo.
  ///
  /// In es, this message translates to:
  /// **'Empieza a adaptar tus documentos hoy'**
  String get landing_cta_final_titulo;

  /// No description provided for @landing_cta_final_subtitulo.
  ///
  /// In es, this message translates to:
  /// **'Crea tu cuenta gratuita y comprueba lo fácil que es hacer accesible cualquier texto.'**
  String get landing_cta_final_subtitulo;

  /// No description provided for @landing_footer_producto.
  ///
  /// In es, this message translates to:
  /// **'Producto'**
  String get landing_footer_producto;

  /// No description provided for @landing_footer_recursos.
  ///
  /// In es, this message translates to:
  /// **'Recursos'**
  String get landing_footer_recursos;

  /// No description provided for @landing_footer_sobre_nosotros.
  ///
  /// In es, this message translates to:
  /// **'Sobre nosotros'**
  String get landing_footer_sobre_nosotros;

  /// No description provided for @landing_footer_redes_label.
  ///
  /// In es, this message translates to:
  /// **'Síguenos en redes sociales'**
  String get landing_footer_redes_label;

  /// No description provided for @landing_footer_red_tiktok.
  ///
  /// In es, this message translates to:
  /// **'Osature en TikTok'**
  String get landing_footer_red_tiktok;

  /// No description provided for @landing_footer_red_instagram.
  ///
  /// In es, this message translates to:
  /// **'Osature en Instagram'**
  String get landing_footer_red_instagram;

  /// No description provided for @landing_footer_red_correo.
  ///
  /// In es, this message translates to:
  /// **'Escríbenos por correo'**
  String get landing_footer_red_correo;

  /// No description provided for @landing_footer_red_linkedin.
  ///
  /// In es, this message translates to:
  /// **'Osature en LinkedIn'**
  String get landing_footer_red_linkedin;

  /// No description provided for @landing_footer_terminos.
  ///
  /// In es, this message translates to:
  /// **'Términos y condiciones'**
  String get landing_footer_terminos;

  /// No description provided for @landing_footer_privacidad.
  ///
  /// In es, this message translates to:
  /// **'Política de privacidad'**
  String get landing_footer_privacidad;

  /// No description provided for @landing_footer_cookies.
  ///
  /// In es, this message translates to:
  /// **'Cookies'**
  String get landing_footer_cookies;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ca', 'en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ca':
      return AppLocalizationsCa();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
