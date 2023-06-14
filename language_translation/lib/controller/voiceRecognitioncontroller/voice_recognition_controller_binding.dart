import 'package:get/get.dart';
import 'package:language_translation/controller/voiceRecognitionController/voice_recognition_controller.dart';

class VoiceRecognitionControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VoiceRecognitionController());
  }
}
