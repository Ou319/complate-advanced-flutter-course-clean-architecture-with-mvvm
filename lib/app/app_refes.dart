import 'package:flutter_next_evel/presentation/ressourses/langague_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';


const String PREF_KEY_LANG = "";
class AppPreference{
  final SharedPreferences? _sharedPreferences;
  AppPreference(this._sharedPreferences);

  Future<String> getApplangague() async{
    String? langague = _sharedPreferences?.getString(PREF_KEY_LANG);

    if(langague != null && langague.isNotEmpty){
      return langague;
    }else{
      return "en";
    }
  }
}