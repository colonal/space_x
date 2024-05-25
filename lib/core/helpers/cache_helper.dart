// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/cache_constants.dart';

class CacheHelpers {
  final SharedPreferences sharedPreferences;
  CacheHelpers({
    required this.sharedPreferences,
  });

  // on boarding
  Future<void> setOnBoardingScreenViewed() async {
    sharedPreferences.setBool(
        CacheConstants.KEY_ONBOARDING_SCREEN_VIEWED, true);
  }

  bool isOnBoardingScreenViewed() {
    return sharedPreferences
            .getBool(CacheConstants.KEY_ONBOARDING_SCREEN_VIEWED) ??
        false;
  }
}
