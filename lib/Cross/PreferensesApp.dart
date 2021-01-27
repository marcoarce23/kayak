import 'package:shared_preferences/shared_preferences.dart';

class PreferensesApp {
  static final PreferensesApp _instancia = new PreferensesApp._internal();

  factory PreferensesApp() {
    return _instancia;
  }

  PreferensesApp._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //get and setters methods
  get imei {
    return _prefs.getString('imei') ?? '-1';
  }

  set imei(String value) {
    _prefs.setString('imei', value);
  }
}
