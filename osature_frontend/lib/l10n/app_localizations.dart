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
