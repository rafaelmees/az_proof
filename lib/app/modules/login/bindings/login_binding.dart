import 'package:az_proof/app/data/providers/session_provider.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    SessionProvider sessionProvider = SessionProvider();
    Get.lazyPut<LoginController>(() => LoginController(sessionProvider));
  }
}
