import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:language_translation/controller/textInputController/text_input_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:translator/translator.dart';

class TranslationController extends GetxController {
  var resultTranslation = ''.obs;
  var langCode = 'hi'.obs;
  final translator = GoogleTranslator();

  @override
  onInit() {
    super.onInit();
    var message = Get.find<TextInputController>().textInputValue;
    setTranslation(message);
  }

  copyText(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  shareText(String text) async {
    debugPrint('share text $text');
    await Share.share(text);
  }

  void setLanguagePicked(String languageCode) {
    langCode.value = languageCode;
    debugPrint('languageCode: $languageCode');
  }

  void setTranslation(String message) {
    debugPrint('sent message: $message');
    translator.translate(message, from: 'en', to: langCode.value).then((str) {
      debugPrint('after translation: $str');
      resultTranslation.value = str.toString();
    }).catchError((err) {
      resultTranslation.value = 'No Langugae translation found';
    });
  }
}
