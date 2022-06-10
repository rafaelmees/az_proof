import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/user_model.dart';
import '../preferences/user_preferences.dart';

class SessionProvider {
  final request = Dio();

  final opt = Options(
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
    headers: {'Content-Type': 'application/json'},
  );

  final baseUrl = 'http://150.230.64.79:9393/proof';

  final prefs = UserPreferences();

  String _error = '';
  String get error => _error;

  Future<bool> signInProvider(String email, String password) async {
    try {
      final response = await request.post(
        '$baseUrl/session',
        data: jsonEncode(
          {
            "email": email,
            "password": password,
          },
        ),
        options: opt,
      );

      if (response.statusCode == 200) {
        var user = UserModel.fromJson(response.data);

        await prefs.deleteUser();
        await prefs.setUser(user);

        return true;
      } else {
        _error = response.data['message'];
        return false;
      }
    } catch (e) {
      _error = e.toString();
      return false;
    }
  }
}
