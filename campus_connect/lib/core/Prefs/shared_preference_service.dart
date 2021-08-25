import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static String _regCompleteKey = 'regComplete';

  static Future<bool> setCompleteReg(bool state) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setBool(_regCompleteKey, state);
  }

  static Future<bool> setAuthCredential(Map<String, dynamic> _payload) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString('auth', _payload.toString());
  }

  static Future<Map<String, dynamic>?> getAuthCredential(
      Map<String, dynamic> _payload) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? _payload = await pref.getString('auth');
    return _payload == null ? null : json.decode(_payload);
  }

  static Future<bool> isCompleteReg() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(_regCompleteKey) ?? false;
  }
}
