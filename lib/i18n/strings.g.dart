/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 50 (25 per locale)
///
/// Built on 2024-06-30 at 17:26 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ru(languageCode: 'ru', build: _StringsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get language => 'English';
	late final _StringsErrorsEn errors = _StringsErrorsEn._(_root);
	late final _StringsHomePageEn home_page = _StringsHomePageEn._(_root);
	late final _StringsSearchPageEn search_page = _StringsSearchPageEn._(_root);
	late final _StringsFilmPageEn film_page = _StringsFilmPageEn._(_root);
	late final _StringsCollectionPageEn collection_page = _StringsCollectionPageEn._(_root);
	late final _StringsLoginPageEn login_page = _StringsLoginPageEn._(_root);
	late final _StringsSignUpPageEn sign_up_page = _StringsSignUpPageEn._(_root);
}

// Path: errors
class _StringsErrorsEn {
	_StringsErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get smth_went_wrong => 'Something went wrong';
	String get unknown => 'Unknown';
	String get null_user => 'User is null';
}

// Path: home_page
class _StringsHomePageEn {
	_StringsHomePageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home_title => 'Home Page';
	String get top_10_pop_films => 'Top 10 Popular Films';
	String get logout => 'Log out';
	String get russian => 'Russian';
	String get english => 'English';
	String get collection => 'Collection';
	String get search_films => 'Search';
}

// Path: search_page
class _StringsSearchPageEn {
	_StringsSearchPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get search => 'Search';
	String get no_founded_films => 'No founded Films';
}

// Path: film_page
class _StringsFilmPageEn {
	_StringsFilmPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Detail Information';
}

// Path: collection_page
class _StringsCollectionPageEn {
	_StringsCollectionPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My Collection';
}

// Path: login_page
class _StringsLoginPageEn {
	_StringsLoginPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Log in';
	String get email => 'e-mail';
	String get password => 'Password';
	String get no_account_sign => 'No account? Then Sign in';
}

// Path: sign_up_page
class _StringsSignUpPageEn {
	_StringsSignUpPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Sign in';
	String get name => 'Name';
	String get email => 'e-mail';
	String get password => 'Password';
	String get confirm_pass => 'Confirm Password';
	String get sign_in => 'Create account';
}

// Path: <root>
class _StringsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override String get language => 'Русский';
	@override late final _StringsErrorsRu errors = _StringsErrorsRu._(_root);
	@override late final _StringsHomePageRu home_page = _StringsHomePageRu._(_root);
	@override late final _StringsSearchPageRu search_page = _StringsSearchPageRu._(_root);
	@override late final _StringsFilmPageRu film_page = _StringsFilmPageRu._(_root);
	@override late final _StringsCollectionPageRu collection_page = _StringsCollectionPageRu._(_root);
	@override late final _StringsLoginPageRu login_page = _StringsLoginPageRu._(_root);
	@override late final _StringsSignUpPageRu sign_up_page = _StringsSignUpPageRu._(_root);
}

// Path: errors
class _StringsErrorsRu implements _StringsErrorsEn {
	_StringsErrorsRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get smth_went_wrong => 'Что-то пошло не так';
	@override String get unknown => 'Неизвестно';
	@override String get null_user => 'Пользователь не найден';
}

// Path: home_page
class _StringsHomePageRu implements _StringsHomePageEn {
	_StringsHomePageRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get home_title => 'Главная страница';
	@override String get top_10_pop_films => 'Топ 10 популярных фильмов';
	@override String get logout => 'Выйти';
	@override String get russian => 'Русский';
	@override String get english => 'Английский';
	@override String get collection => 'Коллекция';
	@override String get search_films => 'Поиск фильмов';
}

// Path: search_page
class _StringsSearchPageRu implements _StringsSearchPageEn {
	_StringsSearchPageRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get search => 'Поиск';
	@override String get no_founded_films => 'Нет найденных фильмов';
}

// Path: film_page
class _StringsFilmPageRu implements _StringsFilmPageEn {
	_StringsFilmPageRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Детальная информация';
}

// Path: collection_page
class _StringsCollectionPageRu implements _StringsCollectionPageEn {
	_StringsCollectionPageRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Моя Коллекция';
}

// Path: login_page
class _StringsLoginPageRu implements _StringsLoginPageEn {
	_StringsLoginPageRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Войти в аккаунт';
	@override String get email => 'email';
	@override String get password => 'Пароль';
	@override String get no_account_sign => 'Нет аккаунта? Зарегистрироваться';
}

// Path: sign_up_page
class _StringsSignUpPageRu implements _StringsSignUpPageEn {
	_StringsSignUpPageRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Регистрация';
	@override String get name => 'Имя';
	@override String get email => 'e-mail';
	@override String get password => 'Пароль';
	@override String get confirm_pass => 'Подтвердить пароль';
	@override String get sign_in => 'Зарегистрироваться';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'language': return 'English';
			case 'errors.smth_went_wrong': return 'Something went wrong';
			case 'errors.unknown': return 'Unknown';
			case 'errors.null_user': return 'User is null';
			case 'home_page.home_title': return 'Home Page';
			case 'home_page.top_10_pop_films': return 'Top 10 Popular Films';
			case 'home_page.logout': return 'Log out';
			case 'home_page.russian': return 'Russian';
			case 'home_page.english': return 'English';
			case 'home_page.collection': return 'Collection';
			case 'home_page.search_films': return 'Search';
			case 'search_page.search': return 'Search';
			case 'search_page.no_founded_films': return 'No founded Films';
			case 'film_page.title': return 'Detail Information';
			case 'collection_page.title': return 'My Collection';
			case 'login_page.title': return 'Log in';
			case 'login_page.email': return 'e-mail';
			case 'login_page.password': return 'Password';
			case 'login_page.no_account_sign': return 'No account? Then Sign in';
			case 'sign_up_page.title': return 'Sign in';
			case 'sign_up_page.name': return 'Name';
			case 'sign_up_page.email': return 'e-mail';
			case 'sign_up_page.password': return 'Password';
			case 'sign_up_page.confirm_pass': return 'Confirm Password';
			case 'sign_up_page.sign_in': return 'Create account';
			default: return null;
		}
	}
}

extension on _StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'language': return 'Русский';
			case 'errors.smth_went_wrong': return 'Что-то пошло не так';
			case 'errors.unknown': return 'Неизвестно';
			case 'errors.null_user': return 'Пользователь не найден';
			case 'home_page.home_title': return 'Главная страница';
			case 'home_page.top_10_pop_films': return 'Топ 10 популярных фильмов';
			case 'home_page.logout': return 'Выйти';
			case 'home_page.russian': return 'Русский';
			case 'home_page.english': return 'Английский';
			case 'home_page.collection': return 'Коллекция';
			case 'home_page.search_films': return 'Поиск фильмов';
			case 'search_page.search': return 'Поиск';
			case 'search_page.no_founded_films': return 'Нет найденных фильмов';
			case 'film_page.title': return 'Детальная информация';
			case 'collection_page.title': return 'Моя Коллекция';
			case 'login_page.title': return 'Войти в аккаунт';
			case 'login_page.email': return 'email';
			case 'login_page.password': return 'Пароль';
			case 'login_page.no_account_sign': return 'Нет аккаунта? Зарегистрироваться';
			case 'sign_up_page.title': return 'Регистрация';
			case 'sign_up_page.name': return 'Имя';
			case 'sign_up_page.email': return 'e-mail';
			case 'sign_up_page.password': return 'Пароль';
			case 'sign_up_page.confirm_pass': return 'Подтвердить пароль';
			case 'sign_up_page.sign_in': return 'Зарегистрироваться';
			default: return null;
		}
	}
}
