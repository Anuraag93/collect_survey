import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class LoadSaveJsonService {
  static Future<void> saveSurvey(String json) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "SurveyJson.json");
    File f = File(path);
    f.writeAsString(json);
  }

  static Future<String> loadSurvey() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, "SurveyJson.json");
      File f = File(path);
      String s = await f.readAsString();
      return s;
    } catch (e) {
      return null;
    }
  }
}
