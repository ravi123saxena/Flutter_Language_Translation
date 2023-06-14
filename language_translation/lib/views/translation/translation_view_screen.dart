import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:language_translation/controller/transalationController/translation_controller.dart';
import 'package:language_translation/widgets/radioButton/custom_button.dart';
import 'package:language_translation/widgets/snackbar/snack_bar.dart';
import '../../controller/textInputController/text_input_controller.dart';

// ignore: must_be_immutable
class TranslationPage extends StatelessWidget {
  TranslationPage({super.key});
  var message = Get.find<TextInputController>().textInputValue;
  var controller = Get.find<TranslationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translation Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Select language to convert your text',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Your language: $message',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: 300,
              height: 40,
              color: Colors.green,
              child: LanguagePickerDropdown(
                  initialValue: Languages.hindi,
                  onValuePicked: (Language language) {
                    controller.setLanguagePicked(language.isoCode);
                  }),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          customButton('Proceed', onPressed: () {
            if (controller.langCode.value.isNotEmpty) {
              controller.setTranslation(
                message,
              );
            } else {
              showSnackBar('Please select language to convert');
            }
          }),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Translated Text:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                controller.resultTranslation.value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customButton('Copy', onPressed: () {
                if (controller.resultTranslation.value.isNotEmpty) {
                  controller.copyText(controller.resultTranslation.value);
                } else {
                  showSnackBar('Please convert your language first then share');
                }
              }),
              customButton('Share', onPressed: () {
                if (controller.resultTranslation.value.isNotEmpty) {
                  controller.shareText(controller.resultTranslation.value);
                } else {
                  showSnackBar('Please convert your language first then share');
                }
              }),
            ],
          ),
        ],
      ),
    );
  }
}
