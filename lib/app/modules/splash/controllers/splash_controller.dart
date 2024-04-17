import 'package:get/get.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/dependency_injection.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    DependencyInjection.init();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.ON_BOARD);
    });
    super.onInit();
  }
}
