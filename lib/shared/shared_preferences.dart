// import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreUtils {
  static saveName(String name) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('Username', name);
  }

  static readName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('Username') ?? '';
  }

  static saveEmail(String email) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('Email', email);
  }

  static readEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('Email') ?? '';
  }

  static savePass(String pass) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('Password', pass);
  }

  static readPass() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('Password') ?? '';
  }

  static saveTanggalGabung(String tanggalGabung) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('tanggal', tanggalGabung);
  }

  static readTanggalGabung() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('tanggal') ?? '';
  }
}
