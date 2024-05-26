import 'package:apple_shop/di/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final _sharedpref = locator.get<SharedPreferences>();
  static final ValueNotifier<String?> changeAuth = ValueNotifier(null);

  static void setToken(String token) {
    _sharedpref.setString("accses_token", token);
    changeAuth.value = token;
  }

  static String get_token() {
    return _sharedpref.getString("accses_token") ?? "";
  }

  static void setUserId(String id){

    _sharedpref.setString("user_id", id);
  }

  static String getUserID(){

    return _sharedpref.getString("user_id") ?? "";
  }

  static void logout() {
    _sharedpref.clear();
    changeAuth.value=null;
  }

  static bool isLoggin(){

    String token=get_token();

    return token.isNotEmpty;


  }
}
