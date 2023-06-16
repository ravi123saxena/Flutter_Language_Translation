import 'package:flutter/material.dart';
import 'package:language_translation/widgets/customButton/styles.dart';

Widget customButton(String str,
    {Color fillColor = Colors.green, required GestureTapCallback onPressed}) {
  return RawMaterialButton(
    fillColor: fillColor,
    splashColor: fillColor,
    onPressed: onPressed,
    shape: const StadiumBorder(),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // const Icon(
          //   Icons.arrow_forward,
          //   color: Colors.white,
          // ),
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
