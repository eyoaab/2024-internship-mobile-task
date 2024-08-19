import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl( {required this.sharedPreferences});

  @override
  Future<void> saveToken(String token) async {
    await sharedPreferences.setString('auth_token', token);
  }

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString('auth_token');
  }

  @override
  Future<void> clearToken() async {
    await sharedPreferences.remove('auth_token');
  }
}
