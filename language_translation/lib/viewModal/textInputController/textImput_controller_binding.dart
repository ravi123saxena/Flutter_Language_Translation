import 'package:get/get.dart';
import 'package:language_translation/viewModal/textInputController/textInput_controller.dart';

class TextInputControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TextInputController());
  }
}
