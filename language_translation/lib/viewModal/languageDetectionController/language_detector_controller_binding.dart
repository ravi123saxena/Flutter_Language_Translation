import 'package:get/get.dart';
import 'package:language_translation/viewModal/languageDetectionController/language_detector_controller.dart';

class LanguageDetectionControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageDetectorController());
  }
}
