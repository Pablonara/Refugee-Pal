import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() =>
      ['en', 'ar', 'fa', 'uk', 'hy', 'fr', 'fj', 'zh_Hans', 'tr', 'my', 'ps'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
    String? faText = '',
    String? ukText = '',
    String? hyText = '',
    String? frText = '',
    String? fjText = '',
    String? zh_HansText = '',
    String? trText = '',
    String? myText = '',
    String? psText = '',
  }) =>
      [
        enText,
        arText,
        faText,
        ukText,
        hyText,
        frText,
        fjText,
        zh_HansText,
        trText,
        myText,
        psText
      ][languageIndex] ??
      '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // home
  {
    'gc2s9drx': {
      'en': 'Explore',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'v1b7t1k0': {
      'en': 'book',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'i138394q': {
      'en': 'book',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'fk5kwe4n': {
      'en': 'All',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'mnpn1f78': {
      'en': 'Search...',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'ftrpzuf4': {
      'en': 'Find Healthcare Professionals',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'g35gljal': {
      'en': 'Locations',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '5ysniyfp': {
      'en': 'Resources',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '4z1r74v3': {
      'en': 'Questions and Answers',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'dis6alpz': {
      'en': 'Explore',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // categoriesgallery
  {
    '3rdvp9rz': {
      'en': 'Digital Resources',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'u0rslaeu': {
      'en': 'Content',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // settings
  {
    'd7ry9zwb': {
      'en': 'Settings',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'a2bj4hem': {
      'en': 'Profile',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'g017plo0': {
      'en': 'Account info',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'k52t3f5q': {
      'en': 'Other info',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'igjbweks': {
      'en': 'Notifications',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'a7t2bpl4': {
      'en': 'Log out',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'f0080zm2': {
      'en': 'Settings',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '35i0840i': {
      'en': 'Settings',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // interactivemap
  {
    '1lvxoyd9': {
      'en': 'Xmark',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'wvn627bu': {
      'en': 'Filter by category',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'obnfndut': {
      'en': 'bars',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '19ijymgm': {
      'en': 'No filter',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '9vplo88o': {
      'en': 'Interactive Map',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'g0sds11o': {
      'en': 'Map',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // refugeepalwelcomescreen
  {
    'a636luf0': {
      'en': 'Welcome to Refugee Pal',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'ffm6jii0': {
      'en': 'An All in One App for Refugees',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'bxj3ytw3': {
      'en': 'Digital Resource Hub',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'pcud7qmp': {
      'en':
          'Our comprehensive library offers user-friendly categories covering a wide range of topics relevant to refugees, including links to trusted resources and services.',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'tuuv8igp': {
      'en': 'Connect with Healthcare Professionals',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '5faocj4g': {
      'en':
          'Find practicing doctors in Surrey who speak your language, breaking down barriers to accessing healthcare.',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'whtqq13n': {
      'en': 'The Newcomer\'s Map',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'rhcs3963': {
      'en':
          'Our map feature displays important locations such as places of worship, food banks, settlement services, and employment. With over 40 essential locations in British Columbia, it offers a comprehensive view of services available to refugees.',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'y6sh2xxa': {
      'en': 'Q&A Chat Threads and Connect with Settlement Workers',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'ldju8z38': {
      'en':
          'Ask questions and get answers from professionals, such as settlement workers, in a structured and organized manner, reducing the workload of settlement workers.',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'z9xmaiwx': {
      'en': 'Accessibility for All',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '85yz6d8b': {
      'en':
          'Our user-friendly design and multilingual support ensures that all refugees can access and use the resources and services offered by the library, as well as availability in both IOS and Android.',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'peqbp5xz': {
      'en': 'Next',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // connecthealthcare
  {
    'a7w5tnpx': {
      'en': 'Healthcare Professionals',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'zwydjgx2': {
      'en': 'Chats',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'd3tgc8z3': {
      'en': 'Which categories do your question fall into?',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '1v9fgrzl': {
      'en': 'Submit Question',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '38iynzcp': {
      'en': 'Add people',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '8ociljkb': {
      'en': 'Subtitle',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'hyv65h6u': {
      'en': 'My Chats',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '8jd7bu6n': {
      'en': 'Search for Answers',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'crub2sa5': {
      'en': 'Hello World',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'u8ih4uo7': {
      'en': 'Find Professionals',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'uw2wpqb5': {
      'en': 'Xmark',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '8wdnx7vu': {
      'en': 'Filter by profession',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'zubc6umi': {
      'en': 'bars',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '6h173vc7': {
      'en': 'No filter',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    's471wtha': {
      'en': 'Connect',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // loginPage
  {
    'b25z0lnb': {
      'en': 'Sign In',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'b1t3a6ch': {
      'en': 'Email Address',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'ui634ol4': {
      'en': 'Enter your email...',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'iokn85bs': {
      'en': 'Password',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'ays017qr': {
      'en': 'Enter your password...',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '8dvyo3cy': {
      'en': 'Forgot Password?',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '2tvvnxy3': {
      'en': 'Sign In',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '4msc8nc7': {
      'en': 'Or use a social account to login',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'anpe57kt': {
      'en': 'Sign Up',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'fe3ijnlc': {
      'en': 'Name',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'fzromcum': {
      'en': 'Enter your name...',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '6hw2jos4': {
      'en': 'Email Address',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'k6k93yzp': {
      'en': 'Enter your email...',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'vee2l8a2': {
      'en': 'Password',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'tufogihr': {
      'en': 'Enter your password...',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'cea9f0kz': {
      'en': 'Create Account',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'xz9x3tes': {
      'en': 'Sign up using a social account',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'qks6glmq': {
      'en': 'Home',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // forgotpassword
  {
    'ot6m1qkl': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '51985oqw': {
      'en': 'Your email address...',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'budoep40': {
      'en': 'Enter your email...',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'ihlym6as': {
      'en': 'Send Link',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'cd9lddpl': {
      'en': 'Forgot Password',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'pxg1b2qn': {
      'en': 'Home',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // category
  {
    'sos4yake': {
      'en': 'Home',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // subcategory
  {
    '2svqgjx9': {
      'en':
          'Note, by clicking on any of the following resource provider cards it will lead you to its website',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'mggzoj7g': {
      'en': 'Home',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // userjourney
  {
    'k9oiuugt': {
      'en': 'Let\'s get to know more about you!',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '06xx27fv': {
      'en':
          'Refugee Pal offers limitless personalization and adaptability for the user. In order for Refugee Pal to maximize user experience, we have to know a bit more about you,  including whether you\'re a refugee or a helper!',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'zf27nomw': {
      'en': 'Next',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'ivnrz971': {
      'en': 'I am a...',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '3h43p3ro': {
      'en': 'Refugee',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'alrn8771': {
      'en': 'Helper',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'vwaqxik8': {
      'en': 'What language do you speak?',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'x6ecpszy': {
      'en': 'English',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'gt3rbman': {
      'en': 'Arabic',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'evyi60rz': {
      'en': 'Farsi (Persian)',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'jb3wiqmo': {
      'en': 'Pashto',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '5vccvec5': {
      'en': 'Ukrainian',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '8vwixaqv': {
      'en': 'Translate the app for me',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'olsedf6i': {
      'en': 'What is your refugee status?',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'gf3uamy2': {
      'en': 'Government Assisted (GAR)',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'wxr0yczb': {
      'en': 'Private Sponsored (PSR)',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'zzwjylqy': {
      'en': 'Blended Visa (BVOR)',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'updq28r5': {
      'en': 'Refugee Claimant',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '53r67qyd': {
      'en': 'What are your main challenges?',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'gg1uy5iv': {
      'en': 'Done',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'c8yb7c4f': {
      'en': 'Home',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // settingsProfile
  {
    '3lzl2wkf': {
      'en': 'Profile',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'k0ilxsop': {
      'en': 'Home',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // mapsheet
  {
    '53r344qf': {
      'en': 'Website',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '65s4fzam': {
      'en': 'Phone',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'nsvhrkvo': {
      'en': 'Email',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'kjgs5jxx': {
      'en': 'Hello World',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // chatInterface
  {
    'ni9f2lh0': {
      'en': 'View Answers',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // chatBox
  {
    '69oo4eqr': {
      'en': 'Message',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // newSheet
  {
    'm19y0ibi': {
      'en': 'New Question',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '8wjpqdec': {
      'en': 'New Private Message',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '4et5028n': {
      'en': 'Cancel',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // button
  {
    'dq3qwq5r': {
      'en': 'Button Text',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // welcome
  {
    'ge35p1nb': {
      'en': 'Hello, ',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '7aqu96ve': {
      'en': 'Andrew',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    'lcnskehw': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'j7lnxwpz': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'ib8ig1rg': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'iedpoocb': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'skbxieek': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'f2ck9g0h': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'qci9ck4q': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'kkayvdkm': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'malryqfy': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'rgcwsnhm': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '5dm34v43': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'papyqqq3': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'mm7qdm6z': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    '7yq8fkym': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'md02u5ir': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'ft4cpqhi': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'bo03yqpc': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'ghxsdf46': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'rgb7je4l': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'a43381e4': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'gpkjpb4b': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
    'xll9c9v7': {
      'en': '',
      'ar': '',
      'fa': '',
      'fj': '',
      'fr': '',
      'hy': '',
      'my': '',
      'ps': '',
      'tr': '',
      'uk': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
