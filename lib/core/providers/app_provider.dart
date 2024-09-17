import 'package:evoltsoft/data/local/pref_keys.dart';
import 'package:evoltsoft/data/local/user_preference.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  dynamic _userProfile;

  dynamic get userProfile => _userProfile;

  void init() {
    _userProfile = UserPreference.getObject(PrefKeys.userProfile);
  }

  void updateUserProfile(dynamic profile) {
    _userProfile = profile;
    notifyListeners();
  }
}
