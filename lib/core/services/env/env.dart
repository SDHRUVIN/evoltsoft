// Package imports:

import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  String get domainUrl => dotenv.env['DOMAIN_URL'] ?? '';
  String get baseApiUrl => dotenv.env['BASE_API_URL'] ?? '';
  String get userListUrl => dotenv.env['USER_LIST_URL'] ?? '';
  String get carListUrl => dotenv.env['CAR_LIST_URL'] ?? '';
}
