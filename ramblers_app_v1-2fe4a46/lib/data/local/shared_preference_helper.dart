import 'package:mississauga/utils/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String memberId = "member_id";
  static const String userId = "user_id";

  static Future<void> saveMemberId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(memberId, id);
    AppConfig.instance.memberId = id;
  }

  static Future<int?> getMemberId() async {
    final prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt(memberId);
    return id;
  }

  static Future<void> saveUserId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(userId, id);
    AppConfig.instance.userId = id;
  }

  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt(userId);
    return id;
  }
}
