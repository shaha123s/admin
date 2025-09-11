import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ar', 'en'];

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
    String? arText = '',
    String? enText = '',
  }) =>
      [arText, enText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // usermangment
  {
    'v6vk1usj': {
      'ar': 'BloomBelly',
      'en': 'BloomBelly',
    },
    'pkj4aacq': {
      'ar': 'الرئيسية',
      'en': 'Home',
    },
    'kouk5ji1': {
      'ar': 'إدارة المستخدمين',
      'en': 'User Management',
    },
    'h2jtcujb': {
      'ar': 'المحفظة',
      'en': 'wallet',
    },
    'xk97zrrk': {
      'ar': 'Usermangement',
      'en': 'User management',
    },
    'q36qaafp': {
      'ar': 'ابحث',
      'en': 'Search',
    },
    'i1d4dra1': {
      'ar': 'اضافة مستخدم ',
      'en': 'Add a user',
    },
    'k2fxp7zx': {
      'ar': 'الاسم \nكامل',
      'en': 'Full Name',
    },
    '6gov9i89': {
      'ar': 'الاسم',
      'en': 'the name',
    },
    'jf5o6434': {
      'ar': 'البريد الإلكتروني',
      'en': 'e-mail',
    },
    'ayvhj8jh': {
      'ar': 'كلمة \nالمرور',
      'en': 'Password',
    },
    'qyoxg6yj': {
      'ar': 'الدور',
      'en': ' role',
    },
    '3apt2t7n': {
      'ar': 'تاريخ \nالحمل',
      'en': 'Date of \npregnancy',
    },
    'ryd96vhz': {
      'ar': 'الرصيد',
      'en': 'Balance',
    },
    'ibc7bj55': {
      'ar': 'التحويلات',
      'en': 'Transfers',
    },
    'ynwc1o6s': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // wallet
  {
    'r8kg3y5s': {
      'ar': 'BloomBelly',
      'en': 'BloomBelly',
    },
    'u6ih6sym': {
      'ar': 'الرئيسية',
      'en': 'Home',
    },
    'fy0oj00z': {
      'ar': 'إدارة المستخدمين',
      'en': 'User Management',
    },
    'yw7v3mlv': {
      'ar': 'المحفظة',
      'en': 'wallet',
    },
    'xjx3j842': {
      'ar': 'wallet',
      'en': 'wallet',
    },
    '23pizvs0': {
      'ar': 'ابحث',
      'en': 'Search',
    },
    'od14a8dn': {
      'ar': 'اسم المستخدم',
      'en': 'user name',
    },
    'c4ut12bn': {
      'ar': 'البريد \nالإلكتروني',
      'en': 'Email',
    },
    'i9k5xwkl': {
      'ar': 'الرصيد\n الحالي ',
      'en': 'Current Balance',
    },
    'vihwsytl': {
      'ar': 'شحن',
      'en': 'shipping',
    },
    '0t47tdfd': {
      'ar': 'اعادة الشحن',
      'en': 'Recharge',
    },
    '86nxrw5q': {
      'ar': 'اعادة الشحن',
      'en': 'Recharge',
    },
    't39p2by1': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // adduserr
  {
    'lw7xeg02': {
      'ar': 'BloomBelly',
      'en': 'BloomBelly',
    },
    's843t702': {
      'ar': 'الرئيسية',
      'en': 'Home',
    },
    'olkjwhi3': {
      'ar': 'إدارة المستخدمين',
      'en': 'User Management',
    },
    'je4glyv8': {
      'ar': 'المحفظة',
      'en': 'wallet',
    },
    'er3uip2h': {
      'ar': 'Add user',
      'en': 'Add user',
    },
    'r4evpci7': {
      'ar': 'ادخل الاسم',
      'en': 'Enter name',
    },
    '8gc88bk9': {
      'ar': 'ادخل البريد لاالكتروني',
      'en': 'Enter your email',
    },
    'rdnq1cx7': {
      'ar': 'ادخل رقم الهاتف',
      'en': 'Enter phone number',
    },
    'leest2pe': {
      'ar': 'الاسم كامل',
      'en': 'Full name',
    },
    '72tjdpb9': {
      'ar': 'البريد لاإلكتروني',
      'en': 'Email',
    },
    'enml0kpg': {
      'ar': 'كلمة المرور',
      'en': 'password',
    },
    'c0q1foe9': {
      'ar': 'تأكيد الكلمة',
      'en': 'Word confirmation',
    },
    'a2fmxk8e': {
      'ar': 'رقم الهاتف ',
      'en': 'phone number',
    },
    'a5kal3kj': {
      'ar': 'اضافة مستخدم',
      'en': 'Add a user',
    },
    'u5q71kfv': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // profile
  {
    '852td2w4': {
      'ar': 'BloomBelly',
      'en': 'BloomBelly',
    },
    '8pnsh4a2': {
      'ar': 'الرئيسية',
      'en': 'Home',
    },
    'yzi15cnh': {
      'ar': 'إدارة المستخدمين',
      'en': 'User Management',
    },
    '0w6tuo0p': {
      'ar': 'المحفظة',
      'en': 'wallet',
    },
    'wopdumi1': {
      'ar': 'profile',
      'en': 'profile',
    },
    'x3pk9046': {
      'ar': 'الاسم',
      'en': 'the name',
    },
    'mcpo20cl': {
      'ar': 'الاسم كامل',
      'en': 'Full name',
    },
    'fj9eyuc4': {
      'ar': 'الدور',
      'en': 'The role',
    },
    'jkrsaiec': {
      'ar': 'الرصيد الحالي',
      'en': 'Current balance',
    },
    '7qm02e7y': {
      'ar': 'رقم الهاتف',
      'en': 'phone number',
    },
    'ni2jktib': {
      'ar': 'اسبوع الحمل',
      'en': 'Pregnancy week',
    },
    'hj2gmm0k': {
      'ar': 'الرقم السري',
      'en': 'secret number',
    },
    '6tg7d26a': {
      'ar': 'البريد الالكتروني ',
      'en': 'e-mail',
    },
    'itva8hfx': {
      'ar': 'الاشتراكات ان وجد',
      'en': 'Subscriptions, if any',
    },
    '0xvv9o4w': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // trans
  {
    '6b88kyfo': {
      'ar': 'BloomBelly',
      'en': 'BloomBelly',
    },
    'drd1aj7p': {
      'ar': 'الرئيسية',
      'en': 'Home',
    },
    'aa1lld8e': {
      'ar': 'إدارة المستخدمين',
      'en': 'User Management',
    },
    'kobwzn1i': {
      'ar': 'المحفظة',
      'en': 'wallet',
    },
    '5xouoy3d': {
      'ar': 'التحويلات',
      'en': 'Transfers',
    },
    'prbkfz12': {
      'ar': 'transactions',
      'en': 'transactions',
    },
    'mv0s78hd': {
      'ar': 'ابحث',
      'en': 'Search',
    },
    'lclh5j02': {
      'ar': 'اسم المستخدم',
      'en': 'user name',
    },
    'tapzfmn9': {
      'ar': 'المبلغ المحول',
      'en': 'Transferred amount',
    },
    '1iwtyioz': {
      'ar': 'التاريخ',
      'en': 'the date',
    },
    'kprebzjt': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // home
  {
    'x76o9zo9': {
      'ar': 'BloomBelly',
      'en': 'BloomBelly',
    },
    'ay8mlkvw': {
      'ar': 'الرئيسية',
      'en': 'Home',
    },
    'dukkp0vx': {
      'ar': 'إدارة المستخدمين',
      'en': 'User Management',
    },
    '3xq4wzr6': {
      'ar': 'المحفظة',
      'en': 'wallet',
    },
    'ktss5o7m': {
      'ar': 'Home',
      'en': 'Home',
    },
    '0cmz6laj': {
      'ar': 'عدد المستخدمين',
      'en': 'Number of users',
    },
    '78z0ru9x': {
      'ar': 'المستخدمين',
      'en': 'Users',
    },
    'jbxma4tp': {
      'ar': 'ابحث',
      'en': 'Search',
    },
    '97axu2eu': {
      'ar': 'الاسم كامل',
      'en': 'Full name',
    },
    'lb0wr27t': {
      'ar': 'البريد\n الإلكتروني',
      'en': 'Email',
    },
    '27rmx7h7': {
      'ar': 'كلمة \nالمرور',
      'en': 'Password',
    },
    'kg1qxzib': {
      'ar': 'الدور',
      'en': 'The role',
    },
    'dkkwf12n': {
      'ar': 'تاريخ الحمل',
      'en': 'Pregnancy date',
    },
    'ny7z7vwm': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // transaction
  {
    'ask9eg3h': {
      'ar': 'BloomBelly',
      'en': 'BloomBelly',
    },
    'e1jrgsav': {
      'ar': 'الرئيسية',
      'en': 'Home',
    },
    'd09cir1q': {
      'ar': 'إدارة المستخدمين',
      'en': 'User Management',
    },
    'v6jxakuh': {
      'ar': 'المحفظة',
      'en': 'wallet',
    },
    'ordh9rdw': {
      'ar': 'transfer',
      'en': 'transactions',
    },
    '3nb53n1t': {
      'ar': 'المبلغ المحول',
      'en': 'Transferred amount',
    },
    'ah4kpeuo': {
      'ar': 'التاريخ',
      'en': 'the date',
    },
    '7ts3vvkp': {
      'ar': 'تعديل',
      'en': 'the date',
    },
    'yuurvzbs': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // AddBalanceDialog
  {
    '5a4ldjsx': {
      'ar': 'ادخل المبلغ',
      'en': 'Enter the amount',
    },
    'udbw02vd': {
      'ar': 'القيمة',
      'en': 'value',
    },
    '1rlcs927': {
      'ar': 'اشحن',
      'en': 'Charge',
    },
  },
  // Miscellaneous
  {
    'qi9npfx9': {
      'ar': '',
      'en': '',
    },
    'gojk62ul': {
      'ar': '',
      'en': '',
    },
    '3dbmvyki': {
      'ar': '',
      'en': '',
    },
    'f3zmj73z': {
      'ar': '',
      'en': '',
    },
    'j0ktq8c3': {
      'ar': '',
      'en': '',
    },
    'qip69kyt': {
      'ar': '',
      'en': '',
    },
    'p54tqo4q': {
      'ar': '',
      'en': '',
    },
    'hsngnjh7': {
      'ar': '',
      'en': '',
    },
    '5hdj0pp3': {
      'ar': '',
      'en': '',
    },
    '9v4qeusg': {
      'ar': '',
      'en': '',
    },
    'sn93t3ri': {
      'ar': '',
      'en': '',
    },
    'mqip7n3g': {
      'ar': '',
      'en': '',
    },
    'nhyd0nre': {
      'ar': '',
      'en': '',
    },
    'ei063jrs': {
      'ar': '',
      'en': '',
    },
    '4k2cu1i1': {
      'ar': '',
      'en': '',
    },
    '0hj1dse0': {
      'ar': '',
      'en': '',
    },
    'g485ze0n': {
      'ar': '',
      'en': '',
    },
    'yc5lcizl': {
      'ar': '',
      'en': '',
    },
    'btju6euk': {
      'ar': '',
      'en': '',
    },
    'tbf4qt0r': {
      'ar': '',
      'en': '',
    },
    'yfg0yygv': {
      'ar': '',
      'en': '',
    },
    'hqy8o0w4': {
      'ar': '',
      'en': '',
    },
    '2ebr688o': {
      'ar': '',
      'en': '',
    },
    '9bdepbld': {
      'ar': '',
      'en': '',
    },
    'smdgzs2e': {
      'ar': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
