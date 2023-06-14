import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:language_translation/controller/homeController/home_controller_binding.dart';
import 'package:language_translation/controller/textInputController/text_input_controller_binding.dart';
import 'package:language_translation/routes/app_routes.dart';
import 'package:language_translation/controller/languageDetectionController/language_detector_controller_binding.dart';
import 'package:language_translation/controller/voiceRecognitioncontroller/voice_recognition_controller_binding.dart';
import 'package:language_translation/views/home/home_screen.dart';
import 'package:language_translation/views/language/language_detector_screen.dart';
import 'package:language_translation/views/textInput/text_input_screen.dart';
import 'package:language_translation/views/voicerecognition/voice_recognition_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: AppRoutes.languageDetectionScreen,
      page: () => const LanguageDetectorScreen(),
      binding: LanguageDetectionControllerBinding(),
    ),
    GetPage(
      name: AppRoutes.voiceRecognitionScreen,
      page: () => VoiceRecognitionScreen(),
      binding: VoiceRecognitionControllerBinding(),
    ),
    GetPage(
      name: AppRoutes.textInputScreen,
      page: () => TextInputScreen(),
      binding: TextInputControllerBinding(),
    ),
  ];
}
