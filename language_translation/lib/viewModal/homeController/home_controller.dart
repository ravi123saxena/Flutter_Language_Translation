import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:language_translation/constants/values.dart';

class HomeController extends GetxController {
  String? select;

  final List<String> translationType = [
    TranslationHelperType.getValue(TranslationType.textInput),
    TranslationHelperType.getValue(TranslationType.voiceRecognition)
  ];

  void onClickRadioButton(value) {
    debugPrint(value);
    select = value;
    update();
  }
}
