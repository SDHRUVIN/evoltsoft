// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `EvoltSoft`
  String get evoltsoft {
    return Intl.message(
      'EvoltSoft',
      name: 'evoltsoft',
      desc: '',
      args: [],
    );
  }

  /// `The EV Charging`
  String get the_ev_charging {
    return Intl.message(
      'The EV Charging',
      name: 'the_ev_charging',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome_title {
    return Intl.message(
      'Welcome',
      name: 'welcome_title',
      desc: '',
      args: [],
    );
  }

  /// `Mirror is your compass on the journey of personal development.`
  String get welcome_sub_title_1 {
    return Intl.message(
      'Mirror is your compass on the journey of personal development.',
      name: 'welcome_sub_title_1',
      desc: '',
      args: [],
    );
  }

  /// `Reflect on experiences, gain insightful perspectives, and walk the path of self-discovery with awareness.`
  String get welcome_sub_title_2 {
    return Intl.message(
      'Reflect on experiences, gain insightful perspectives, and walk the path of self-discovery with awareness.',
      name: 'welcome_sub_title_2',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `What should we call you?`
  String get on_board_name_title {
    return Intl.message(
      'What should we call you?',
      name: 'on_board_name_title',
      desc: '',
      args: [],
    );
  }

  /// `Pick a pen name, or use your real one, it's your adventure!`
  String get on_board_name_sub_title {
    return Intl.message(
      'Pick a pen name, or use your real one, it\'s your adventure!',
      name: 'on_board_name_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `When’s your birthday?`
  String get on_board_birthday_title {
    return Intl.message(
      'When’s your birthday?',
      name: 'on_board_birthday_title',
      desc: '',
      args: [],
    );
  }

  /// `Just a little info to help us tailor your experience. No time travel required!`
  String get on_board_birthday_sub_title {
    return Intl.message(
      'Just a little info to help us tailor your experience. No time travel required!',
      name: 'on_board_birthday_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Non-binary`
  String get non_binary {
    return Intl.message(
      'Non-binary',
      name: 'non_binary',
      desc: '',
      args: [],
    );
  }

  /// `Not Listed`
  String get not_listed {
    return Intl.message(
      'Not Listed',
      name: 'not_listed',
      desc: '',
      args: [],
    );
  }

  /// `What gender do you identify with?`
  String get on_board_gender_title {
    return Intl.message(
      'What gender do you identify with?',
      name: 'on_board_gender_title',
      desc: '',
      args: [],
    );
  }

  /// `We celebrate diversity and respect your identity.`
  String get on_board_gender_sub_title {
    return Intl.message(
      'We celebrate diversity and respect your identity.',
      name: 'on_board_gender_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Where are you from?`
  String get on_board_country_title {
    return Intl.message(
      'Where are you from?',
      name: 'on_board_country_title',
      desc: '',
      args: [],
    );
  }

  /// `Setting the scene for your story. Which part of the world are you joining us from?`
  String get on_board_country_sub_title {
    return Intl.message(
      'Setting the scene for your story. Which part of the world are you joining us from?',
      name: 'on_board_country_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Saved`
  String get saved {
    return Intl.message(
      'Saved',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `Garage`
  String get garage {
    return Intl.message(
      'Garage',
      name: 'garage',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get my_account {
    return Intl.message(
      'My Account',
      name: 'my_account',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Charging Activity`
  String get charging_activity {
    return Intl.message(
      'Charging Activity',
      name: 'charging_activity',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get date_of_birth {
    return Intl.message(
      'Date of Birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Number of cars`
  String get number_of_cars {
    return Intl.message(
      'Number of cars',
      name: 'number_of_cars',
      desc: '',
      args: [],
    );
  }

  /// `Membership Invoices`
  String get membership_invoices {
    return Intl.message(
      'Membership Invoices',
      name: 'membership_invoices',
      desc: '',
      args: [],
    );
  }

  /// `Add offer code`
  String get add_offer_code {
    return Intl.message(
      'Add offer code',
      name: 'add_offer_code',
      desc: '',
      args: [],
    );
  }

  /// `Replace card or key fob`
  String get replace_card_or_key_fob {
    return Intl.message(
      'Replace card or key fob',
      name: 'replace_card_or_key_fob',
      desc: '',
      args: [],
    );
  }

  /// `Update payment details`
  String get update_payment_details {
    return Intl.message(
      'Update payment details',
      name: 'update_payment_details',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade Subscription`
  String get upgrade_subscription {
    return Intl.message(
      'Upgrade Subscription',
      name: 'upgrade_subscription',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `EkW Plus`
  String get ekw_plus {
    return Intl.message(
      'EkW Plus',
      name: 'ekw_plus',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle List`
  String get vehicle_list {
    return Intl.message(
      'Vehicle List',
      name: 'vehicle_list',
      desc: '',
      args: [],
    );
  }

  /// `Timeline`
  String get timeline {
    return Intl.message(
      'Timeline',
      name: 'timeline',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get distance {
    return Intl.message(
      'Distance',
      name: 'distance',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance`
  String get maintenance {
    return Intl.message(
      'Maintenance',
      name: 'maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Distance, mi`
  String get distance_mi {
    return Intl.message(
      'Distance, mi',
      name: 'distance_mi',
      desc: '',
      args: [],
    );
  }

  /// `Daily average, mi`
  String get daily_average {
    return Intl.message(
      'Daily average, mi',
      name: 'daily_average',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get expenses {
    return Intl.message(
      'Expenses',
      name: 'expenses',
      desc: '',
      args: [],
    );
  }

  /// `USD/mi`
  String get usd_mi {
    return Intl.message(
      'USD/mi',
      name: 'usd_mi',
      desc: '',
      args: [],
    );
  }

  /// `Fuel consumption`
  String get fuel_consumption {
    return Intl.message(
      'Fuel consumption',
      name: 'fuel_consumption',
      desc: '',
      args: [],
    );
  }

  /// `Electric`
  String get electric {
    return Intl.message(
      'Electric',
      name: 'electric',
      desc: '',
      args: [],
    );
  }

  /// `kWh/100mi`
  String get kwh_100_mi {
    return Intl.message(
      'kWh/100mi',
      name: 'kwh_100_mi',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get no_internet_connection {
    return Intl.message(
      'No internet connection',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No!`
  String get no {
    return Intl.message(
      'No!',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get exit_app_title {
    return Intl.message(
      'Are you sure?',
      name: 'exit_app_title',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to exit App?`
  String get exit_app_sub_title {
    return Intl.message(
      'Do you want to exit App?',
      name: 'exit_app_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Under Development`
  String get under_development {
    return Intl.message(
      'Under Development',
      name: 'under_development',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get none {
    return Intl.message(
      'None',
      name: 'none',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
