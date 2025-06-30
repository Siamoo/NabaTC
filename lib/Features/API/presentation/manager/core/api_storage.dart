// ✅ api_storage.dart (helper)
import 'package:shared_preferences/shared_preferences.dart';

class ApiStorage {
  static const _predictionKey = 'prediction_url';
  static const _treatmentKey = 'treatment_url';

  static Future<void> savePredictionUrl(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_predictionKey, url);
  }

  static Future<String?> getPredictionUrl() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_predictionKey);
  }

  static Future<void> saveTreatmentUrl(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_treatmentKey, url);
  }

  static Future<String?> getTreatmentUrl() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_treatmentKey);
  }
}
