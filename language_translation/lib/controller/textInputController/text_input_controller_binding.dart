import 'package:get/get.dart';
import 'package:language_translation/controller/textInputController/text_input_controller.dart';

class TextInputControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TextInputController());
  }
}
