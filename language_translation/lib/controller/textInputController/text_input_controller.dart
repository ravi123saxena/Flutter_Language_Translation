import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextInputController extends GetxController {
  var textInputValue = '';
 
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  void onChangeText(value) {
    debugPrint(value);
    textInputValue = value;
    debugPrint(textInputValue);
    update();
  }
}
