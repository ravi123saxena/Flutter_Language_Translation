import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translation/controller/languageDetectionController/language_detector_controller.dart';
import 'package:language_translation/routes/app_routes.dart';
import 'package:language_translation/views/language/styles.dart';
import 'package:language_translation/widgets/customButton/custom_button.dart';

import '../../controller/textInputController/text_input_controller.dart';

class LanguageDetectorScreen extends StatefulWidget {
  const LanguageDetectorScreen({super.key});

  @override
  State<LanguageDetectorScreen> createState() => _LanguageDetectorScreen();
}

class _LanguageDetectorScreen extends State<LanguageDetectorScreen> {
  var message = Get.find<TextInputController>().textInputValue;
  var languageController = Get.find<LanguageDetectorController>();

  @override
  void initState() {
    super.initState();
    languageController.identifyLanguage(message).then((value) {
      debugPrint('received value: $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Input Screen'),
      ),
      body: GetBuilder<LanguageDetectorController>(
        builder: (controller) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    kLabelMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: kEnteredMessage,
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    kLabelLanguage,
                    textAlign: TextAlign.center,
                    style: kDetectedLanguageStyle,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    '${controller.detectedLanguage}',
                    textAlign: TextAlign.center,
                    style: kLanguageDetectedText,
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    'Do you want to translate into different language ?',
                    textAlign: TextAlign.center,
                    style: kLanguageDetectedText,
                  ),
                  const SizedBox(height: 100.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customButton('Yes', onPressed: () {
                        Get.toNamed(AppRoutes.translationScreen);
                      }),
                      customButton('No', onPressed: () {
                        debugPrint('No');
                      }),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
