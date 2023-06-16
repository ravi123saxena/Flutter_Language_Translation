import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translation/constants/values.dart';
import 'package:language_translation/controller/homeController/home_controller.dart';
import 'package:language_translation/views/home/styles.dart';
import 'package:language_translation/widgets/customButton/custom_button.dart';

import '../../routes/app_routes.dart';
import '../../widgets/snackbar/snack_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Row addRadioButton(int btnIndex, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GetBuilder<HomeController>(
          builder: (controller) => Radio(
              activeColor: Colors.blue,
              value: controller.translationType[btnIndex],
              groupValue: controller.select,
              onChanged: (value) => controller.onClickRadioButton(value)),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
          const Text(
            kHeaderTitle,
            textAlign: TextAlign.center,
            style: kHeaderStyle,
          ),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              addRadioButton(
                  0, TranslationHelperType.getValue(TranslationType.textInput)),
              addRadioButton(
                  1,
                  TranslationHelperType.getValue(
                      TranslationType.voiceRecognition)),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          customButton('Proceed', onPressed: () {
            if (Get.find<HomeController>().select != null) {
              Get.find<HomeController>().select ==
                      TranslationHelperType.getValue(TranslationType.textInput)
                  ? Get.toNamed(AppRoutes.textInputScreen)
                  : Get.toNamed(AppRoutes.voiceRecognitionScreen);
            } else {
              showSnackBar(kInfoTitle);
            }
          }),
        ],
      ),
    );
  }
}
