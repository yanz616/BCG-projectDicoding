// import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreUtils {
  static saveName(String name) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('Username', name);
  }

  static readName(String name) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('Username');
  }

  static saveEmail(String email) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('Email Address', email);
  }

  static readEmail(String email) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('Email Addres');
  }

  static savePass(String password) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('Password', password);
  }

  static readPass(String password) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('Password');
  }
}
