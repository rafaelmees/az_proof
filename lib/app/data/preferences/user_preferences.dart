import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserPreferences {
  UserPreferences();

  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String name = prefs.getString("name") ?? '';
    String email = prefs.getString("email") ?? '';
    String token = prefs.getString("token") ?? '';
    String id = prefs.getString("idSeller") ?? '';

    return UserModel(
      profile: Profile(name: name),
      email: email,
      token: token,
      id: id,
    );
  }

  Future<void> setUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('name', (user.profile ?? Profile()).name ?? '');
    prefs.setString('email', user.email ?? '');
    prefs.setString('token', user.token ?? '');
    prefs.setString('idSeller', user.id ?? '');
  }

  Future<void> deleteUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("token") ?? '';
  }

  Future<String> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("name") ?? '';
  }
}
