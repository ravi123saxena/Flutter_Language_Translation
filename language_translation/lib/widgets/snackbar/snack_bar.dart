import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController showSnackBar(String title) {
  return Get.rawSnackbar(
      messageText: Text(title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16)),
      isDismissible: false,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red[400]!,
      icon: const Icon(
        Icons.info,
        color: Colors.white,
        size: 35,
      ),
      margin: EdgeInsets.zero,
      snackStyle: SnackStyle.GROUNDED);
}
