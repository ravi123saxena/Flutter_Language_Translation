import 'package:flutter/material.dart';

TextFormField createInputField(
  TextEditingController editController,
  String text, {
  TextInputType keyboard = TextInputType.text,
  bool isSecured = false,
  Widget? frontIcon,
  Widget? trailIcon,
  ValueChanged<String>? onChanged,
}) {
  return TextFormField(
    controller: editController,
    obscureText: isSecured,
    onChanged: onChanged,
    decoration: InputDecoration(
      labelText: text,
      hintText: 'Enter $text',
      icon: frontIcon,
      suffixIcon: trailIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return 'The field can not be blank';
      }
      return null;
    },
  );
}
