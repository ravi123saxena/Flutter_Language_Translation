import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:language_translation/controller/transalationController/translation_controller.dart';

class TranslationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TranslationController());
  }
}
