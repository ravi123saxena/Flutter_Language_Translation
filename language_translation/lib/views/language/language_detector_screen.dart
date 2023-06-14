import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translation/controller/languageDetectionController/language_detector_controller.dart';
import 'package:language_translation/views/language/styles.dart';

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

  Widget renderButton(text, {required GestureTapCallback onPressed}) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.all(30),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => onPressed,
            child: Text(text, style: kButtonStyle),
          ), // trying to move to the bottom
        ),
      ),
    );
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
                  renderButton('Share', onPressed: () {
                    languageController.shareText(message);
                  }),
                  const Text(
                    'Please use physical device to share',
                    style: TextStyle(fontSize: 18),
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
