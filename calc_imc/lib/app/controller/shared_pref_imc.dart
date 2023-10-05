import 'package:shared_preferences/shared_preferences.dart';

class IMCSharedPreferences {
  static const String keyIMC = 'imc';

  Future<void> salvarIMC(double imc) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(keyIMC, imc);
  }

  Future<double?> recuperarIMC() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(keyIMC);
  }
}
