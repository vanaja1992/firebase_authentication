import 'package:shared_preferences/shared_preferences.dart';
class StorageService {
  static Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }

  static Future<void> writeData(String key, String value) async {
    SharedPreferences preferences = await getInstance();
    preferences.setString(key, value);
  }

  static Future<String?> readData(String key) async {
    SharedPreferences preferences = await getInstance();
    return preferences.getString(key);
  }
  static Future<void> clearAllData() async {
    SharedPreferences preferences = await getInstance();
    preferences.clear();
  }
}