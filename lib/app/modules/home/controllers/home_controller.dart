import 'package:az_proof/app/data/preferences/user_preferences.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final user = UserPreferences().obs;
  final userName = ''.obs;

  @override
  void onInit() {
    getName();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getName() async {
    userName.value = await user.value.getName();
  }
}
