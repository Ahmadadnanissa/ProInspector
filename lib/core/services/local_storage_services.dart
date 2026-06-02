import 'package:hive/hive.dart';

class EmployeeLocalStorageService {
  static final box = Hive.box('employeeAuthBox');

  static const String _themeKey = "isDarkMode";

  // ================= TOKEN =================

  static Future<void> saveToken(String token) async {
    await box.put('token', token);
  }

  static String? getToken() {
    return box.get('token');
  }

  // ================= USER =================

  static Future<void> saveEmployee({
    required String id,
    required String name,
    required String email,
  }) async {
    await box.put('id', id);
    await box.put('name', name);
    await box.put('email', email);
  }

  static String? getId() {
    return box.get('id');
  }

  static String? getName() {
    return box.get('name');
  }

  static String? getEmail() {
    return box.get('email');
  }

  // ================= THEME =================

  static Future<void> saveThemeMode(bool isDark) async {
    await box.put(_themeKey, isDark);
  }

  static bool getThemeMode() {
    return box.get(_themeKey, defaultValue: false);
  }

  // ================= LOGOUT =================

  static Future<void> logout() async {
    await box.clear();
  }
}
