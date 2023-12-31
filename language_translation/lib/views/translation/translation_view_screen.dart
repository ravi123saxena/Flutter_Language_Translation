import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/language_picker_dropdown_controller.dart';
import 'package:language_picker/languages.dart';
import 'package:language_translation/controller/transalationController/translation_controller.dart';
import 'package:language_translation/views/translation/styles.dart';
import 'package:language_translation/widgets/customButton/custom_button.dart';
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
        title: const Text('Translation'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'You have entered:',
            style: kSelectLanStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(width: 1.0),
                  borderRadius: BorderRadius.circular(5)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              kSelectlangText,
              style: kSelectLanStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: 300,
              height: 50,
              color: Colors.yellowAccent,
              child: LanguagePickerDropdown(
                  initialValue: Languages.english,
                  itemBuilder: (language) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          language.name,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      ),
                  onValuePicked: (Language language) {
                    controller.setLanguagePicked(language.isoCode);
                    controller.setTranslation(
                      message,
                    );
                  }),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Translated Text:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(width: 1.0),
                    borderRadius: BorderRadius.circular(5)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.resultTranslation.value,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
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
                  showSnackBar(kSnackBarTitleCopyText);
                }
              }, fillColor: Colors.green),
              customButton('Share', onPressed: () {
                if (controller.resultTranslation.value.isNotEmpty) {
                  controller.shareText(controller.resultTranslation.value);
                } else {
                  showSnackBar(kSnackBarTitleText);
                }
              }, fillColor: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
