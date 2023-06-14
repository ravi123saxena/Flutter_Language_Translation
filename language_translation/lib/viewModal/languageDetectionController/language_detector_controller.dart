import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learning_language/learning_language.dart';
import 'package:share_plus/share_plus.dart';

class LanguageDetectorController extends GetxController {
  String? detectedLanguage = '';
  var text = '';

  copyText(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  pasteText() async {
    ClipboardData? clipborad = await Clipboard.getData('text/plain');
    text = clipborad!.text!;
    debugPrint('paste: $text');
  }

  shareText(String text) async {
    await Share.share(
      text,
    );
  }

  Future<String> identifyLanguage(message) async {
    debugPrint(message);
    LanguageIdentifier identifier = LanguageIdentifier();
    try {
      String language = await identifier.identify(message);
      if (language.isNotEmpty) {
        detectedLanguage = language;
      } else {
        detectedLanguage = 'No language was identified.Please go back and try again with different text';
        debugPrint('identified language: $language');
      }
    } catch (err) {
      debugPrint('No language was identified');
    }
    update();
    return detectedLanguage!;
  }
}
