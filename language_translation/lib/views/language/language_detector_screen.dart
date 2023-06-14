import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translation/viewModal/languageDetectionController/language_detector_controller.dart';
import 'package:language_translation/viewModal/textInputController/textInput_controller.dart';

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
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ), // trying to move to the bottom
          ),
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
                    'Entered Message:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    'Detected Language:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                   const SizedBox(height: 10.0),
                  Text(
                    '${controller.detectedLanguage}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  
                  renderButton('Share', onPressed: () {
                    languageController.shareText(message);
                  }),
                  const Text(
                    'Please use physical device to share',
                    style:  TextStyle(fontSize: 18),
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
