import 'package:get/get.dart';
import 'package:task6/core/class/crud.dart';
import 'package:task6/view/log_sign/auth_controller/auth_controller.dart';
import 'package:task6/view/menu/menu_controller.dart';
import 'package:task6/view/onboarding/onboarding_controller.dart';
import 'package:task6/view/profile/profile_controller.dart';

import '../view/search/search_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Start
    Get.put(Crud());
    Get.put(MenController(), permanent: true);
    Get.put(AuthController(), permanent: true);
    Get.put(OnboardingController(), permanent: true);
    Get.put(ProfileController(), permanent: true);
    Get.put(SerchController(), permanent: true);
  }
}
