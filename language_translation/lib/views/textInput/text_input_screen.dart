import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translation/controller/textInputController/text_input_controller.dart';
import 'package:language_translation/views/textInput/styles.dart';
import 'package:language_translation/widgets/textInput/text_input_field.dart';
import '../../routes/app_routes.dart';
import '../../widgets/customButton/custom_button.dart';

// ignore: must_be_immutable
class TextInputScreen extends StatelessWidget {
  TextInputScreen({Key? key}) : super(key: key);

  var messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void onButtonPressed() {
    if (_formKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.languageDetectionScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kScreenTitle),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<TextInputController>(
                  builder: (controller) => createInputField(
                      messageController, kHintText,
                      onChanged: (value) => controller.onChangeText(value)),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              customButton('Proceed', onPressed: () {
                onButtonPressed();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
