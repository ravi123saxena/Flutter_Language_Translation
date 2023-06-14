import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translation/controller/textInputController/text_input_controller.dart';
import 'package:language_translation/routes/app_routes.dart';
import 'package:language_translation/controller/voiceRecognitionController/voice_recognition_controller.dart';
import 'package:language_translation/views/voicerecognition/styles.dart';
import 'package:language_translation/widgets/snackbar/snack_bar.dart';

// ignore: must_be_immutable
class VoiceRecognitionScreen extends StatelessWidget {
  VoiceRecognitionScreen({Key? key}) : super(key: key);
  final controller = Get.find<VoiceRecognitionController>();

  var language = ['English', 'Hindi', 'Chinese', 'French'];
  List locale = ['en-US', 'hi-IN', 'zh-CN', 'fr-CA'];
  var selectedLanguage = 'English';
  double formMarginHoriz = 10.0;
  double formMarginVert = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => AvatarGlow(
          animate: controller.isListening.value,
          glowColor: Theme.of(context).primaryColor,
          endRadius: 90.0,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(
            onPressed: () => controller.listen(),
            child:
                Icon(controller.isListening.value ? Icons.mic : Icons.mic_none),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(kVoiceText),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              kSelectLanguageText,
              style: kSelectLanguageTextStyle,
            ),
          ),
          GetX<VoiceRecognitionController>(
            builder: (controller) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                controller.speechText.value,
                style: kTextStyle,
              ),
            ),
          ),
          
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(30),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (Get.find<TextInputController>()
                        .textInputValue
                        .isNotEmpty) {
                      Get.toNamed(AppRoutes.languageDetectionScreen);
                      controller.isListening.value = false;
                    } else {
                      showSnackBar(kInfoTitle);
                    }
                  },
                  child: const Text(
                    kProceedText,
                    style: kProceedTextStyle,
                  ), // trying to move to the bottom
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
