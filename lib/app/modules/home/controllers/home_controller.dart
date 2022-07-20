import 'package:az_proof/app/data/models/dashboard_model.dart';
import 'package:az_proof/app/data/preferences/user_preferences.dart';
import 'package:az_proof/app/data/providers/dashboard_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  DashboardProvider dashboardProvider;

  HomeController(this.dashboardProvider);

  final user = UserPreferences().obs;
  final userName = ''.obs;
  final dashboard = DashboardModel().obs;

  @override
  void onInit() async {
    await getName();
    await getOrders();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getName() async {
    userName.value = await user.value.getName();
  }

  Future<void> getOrders() async {
    dashboard.value = await dashboardProvider.dashboardProvider();
  }
}
