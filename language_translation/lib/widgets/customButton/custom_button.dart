import 'package:flutter/material.dart';
import 'package:language_translation/widgets/customButton/styles.dart';

Widget customButton(String str, {required GestureTapCallback onPressed}) {
  return RawMaterialButton(
    fillColor: Colors.blueAccent,
    splashColor: Colors.blueAccent,
    onPressed: onPressed,
    shape: const StadiumBorder(),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            str,
            style: kTitle,
          ),
        ],
      ),
    ),
  );
}
