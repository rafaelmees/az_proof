import 'package:az_proof/app/data/models/dashboard_model.dart';
import 'package:dio/dio.dart';
import '../preferences/user_preferences.dart';
import 'package:get/get.dart';

class DashboardProvider {
  final request = Dio();

  final user = UserPreferences().obs;

  final opt = Options(
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
    headers: {
      'Content-Type': 'application/json',
      'Authorization': '${UserPreferences().obs.value.getToken()}',
    },
  );

  final baseUrl = 'http://150.230.64.79:9393/proof';

  final prefs = UserPreferences();

  String _error = '';
  String get error => _error;

  Future<DashboardModel> dashboardProvider() async {
    try {
      opt.headers = {
        ...(opt.headers ?? {}),
        'Authorization': 'Bearer ${await user.value.getToken()}',
      };

      final response = await request.get(
        '$baseUrl/dashboard',
        options: opt,
      );

      if (response.statusCode == 200) {
        return DashboardModel.fromJson(response.data);
      } else {
        _error = response.data['message'];
        throw Exception(_error);
      }
    } catch (e) {
      _error = e.toString();
      throw Exception(_error);
    }
  }
}
