import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translation/routes/app_routes.dart';
import 'package:language_translation/viewModal/textInputController/textInput_controller.dart';
import 'package:language_translation/viewModal/voiceRecognitionController/voiceRecognition_controller.dart';
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
        title: const Text('Voice Recognition Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Please select language and press the mic button to speack and stop when done...',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Obx(
            () => Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 0.80),
                ),
                child: DropdownButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: const Text('Please Select language'),
                  items: language.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                  value: controller.selectedLanguage.value,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.setSelectedLanguage(newValue);
                      controller.setSelectedLanguageCode(
                          locale[language.indexOf(newValue)]);
                    }
                  },
                ),
              ),
            ),
          ),
          GetX<VoiceRecognitionController>(
            builder: (controller) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                controller.speechText.value,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),
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
                      showSnackBar('Please speak some words');
                    }
                  },
                  child: const Text(
                    '-> Proceed',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
