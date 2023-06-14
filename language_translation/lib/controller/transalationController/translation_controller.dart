import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:translator/translator.dart';

class TranslationController extends GetxController {
  var resultTranslation = ''.obs;
  var langCode = 'ko'.obs;
  final translator = GoogleTranslator();

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
