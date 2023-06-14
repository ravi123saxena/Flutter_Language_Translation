import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:language_translation/controller/textInputController/text_input_controller.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceRecognitionController extends GetxController {
  final textController = Get.put<TextInputController>(TextInputController());
  var isListening = false.obs;
  var speechText = ''.obs;
  late stt.SpeechToText _speech;
  var selectedLanguage = "English".obs;
  var selectedLanguageCode = "en-US".obs;

  @override
  void onInit() {
    super.onInit();
    _speech = stt.SpeechToText();
  }

  @override
  void onClose() {
    super.onClose();
    _speech.stop();
    speechText.value = '';
    isListening.value = false;
  }

  void setSelectedLanguageCode(String value) {
    selectedLanguageCode.value = value;
    debugPrint('detexted value: $value');
  }

  void setSelectedLanguage(String value) {
    selectedLanguage.value = value;
  }

  void resetLanguage() {
    speechText.value = '';
  }

  void listen() async {
    if (!isListening.value) {
      bool available = await _speech.initialize(onStatus: (value) {
        debugPrint('test: $value');
      }, onError: (value) {
        debugPrint('test: $value as String?');
      });
      if (available) {
        isListening.value = true;
        _speech.listen(
            localeId: selectedLanguageCode.value,
            onResult: (val) {
              speechText.value = val.recognizedWords;
              textController.textInputValue = val.recognizedWords;
            });
      }
    } else {
      isListening.value = false;
      _speech.stop();
      speechText.value = '';
    }
  }
}
