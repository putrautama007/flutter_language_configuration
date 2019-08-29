import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {

  savePref(String path) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("lang", path);
  }

}