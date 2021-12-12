
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefs {

  static SharedPreferences? _prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences?> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }



  // get && set string
  static Future<bool?> setIdToken(String value) async => await _prefs?.setString("id_token", value);
  static String? getIdToken() => _prefs?.getString("id_token") ?? "";   // default value is ""


  // get && set string
  static Future<bool?> setRefreshToken(String value) async => await _prefs?.setString("refresh_token", value);
  static String? getRefreshToken() => _prefs?.getString("refresh_token") ?? "";   // default value is ""



  // get && set string
  static Future<bool?> setAccessToken(String value) async => await _prefs?.setString("access_token", value);
  static String? getAccessToken() => _prefs?.getString("access_token") ?? "";


// // get && set int
// static Future<bool?> setInt(int value) async => await _prefs?.setInt("MyIntKey", value);
// static int? getInt() => _prefs?.getInt("MyIntKey") ?? 0;  // default value is 0
//
//
// // get && set boolean
// static Future<bool?> setBool(bool value) async => await _prefs?.setBool("MyBooleanKey" , value);
// static bool? getBool() => _prefs?.getBool("MyBooleanKey") ?? true;  // default value is true
//
//
//
// // get && set double
// static Future<bool?> setDouble(double value) async => await _prefs?.setDouble("MyDoubleKey", value);
// static double? getDouble() => _prefs?.getDouble("MyDoubleKey") ?? 0.0;  // default value is 0.0
//
//
// // get && set list<String>
// static Future<bool?> setStringList(dynamic value) async => await _prefs?.setStringList("MyStringListKey", value);
// // static List<dynamic? getStringList() => _prefs?.getStringList("MyStringListKey") ?? [];   // default value is []
// static dynamic? getStringList() => _prefs?.getStringList("MyStringListKey") ?? [];   // default value is []
//
//
// // clear all sharePref
// static Future<bool?> clear() async => await _prefs?.clear();



}