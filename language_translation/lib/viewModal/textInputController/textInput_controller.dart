import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextInputController extends GetxController {
  var textInputValue = '';

  void onChangeText(value) {
    debugPrint(value);
    textInputValue = value;
    debugPrint(textInputValue);
    update();
  }
}
