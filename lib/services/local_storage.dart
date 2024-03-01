

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static late SharedPreferences prefs;  // el late sirve para que la clase sepa que por ahora no tiene valor pero luego si

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance(); // si o si hay que esperar a que sharedPrefences nos de una instancia
  }

}