import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  /// Indicates if the user is a first time user. `true` at first start
  static const String COREDATA_FTU_KEY = 'coredata.firsttimeuser.key';

  Future<T> get<T>(String key) async => (await SharedPreferences.getInstance()).get(key);

  Future<bool> setString(String key, String value) async =>
      (await SharedPreferences.getInstance()).setString(key, value);

  Future<bool> setBool(String key, bool value) async =>
      (await SharedPreferences.getInstance()).setBool(key, value);

  /// Initialize first app settings.
  static Future<void> setup() async {
    final firstTimeUser = await AppSharedPreferences().get<bool>(COREDATA_FTU_KEY) ?? true;
    if (firstTimeUser) {
      await AppSharedPreferences().setBool(COREDATA_FTU_KEY, true);
    }
  }
}
