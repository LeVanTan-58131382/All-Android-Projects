import 'package:learning_english_with_getx/services/localStorage/app_localStorage_abstract.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorageImplement extends AppLocalStorageAbstract
{
  late String _currentAccessToken;
  late Future<SharedPreferences> _accessToken;

  @override
  void init() {
    // TODO: implement init
    _currentAccessToken = "";
    _accessToken = SharedPreferences.getInstance();
  }

  @override
  Future<String> getCurrentValue() async {
    // TODO: implement getCurrentValue
    final SharedPreferences accessToken = await _accessToken;
    _currentAccessToken = accessToken.getString("currentToken") ?? "";

    print("currentToken from local storage: $_currentAccessToken");

    return _currentAccessToken;
  }

  @override
  Future<bool> saveCurrentValue({required String value}) async {
    // TODO: implement saveCurrentValue
    final SharedPreferences accessToken = await _accessToken;
    accessToken.setString("currentToken", value).then((bool success) {
      _currentAccessToken = value;
      print("currentToken after save: $_currentAccessToken");
      return true;
    });

    return false;
  }

  @override
  Future<bool> deleteCurrentValue() async {
    // TODO: implement deleteCurrentValue
    final SharedPreferences accessToken = await _accessToken;
    accessToken.setString("currentToken", "").then((bool success) {
      _currentAccessToken = "";
      print("currentToken after delete: $_currentAccessToken");
      return true;
    });

    return false;
  }

}