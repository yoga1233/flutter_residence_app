import 'package:flutter_residence_app/data/model/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  static AuthResponseModel? userData;

  Future<void> saveAuthData(AuthResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth_data', data.toJson());
    AuthLocalDatasource.userData = data;
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
    AuthLocalDatasource.userData = null;
  }

  Future<void> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString('auth_data');
    if (data != null) {
      AuthLocalDatasource.userData = AuthResponseModel.fromJson(data);
    } else {
      AuthLocalDatasource.userData = null;
    }
  }
}
