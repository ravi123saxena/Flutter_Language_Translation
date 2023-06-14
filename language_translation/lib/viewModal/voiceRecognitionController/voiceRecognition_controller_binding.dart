import 'package:get/get.dart';
import 'package:language_translation/viewModal/voiceRecognitionController/voiceRecognition_controller.dart';

class VoiceRecognitionControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VoiceRecognitionController());
  }
}
