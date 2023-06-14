import 'package:flutter/material.dart';

 Widget customButton({required GestureTapCallback onPressed}) {
    return RawMaterialButton(
      fillColor: Colors.blueAccent,
      splashColor: Colors.blueAccent,
      onPressed: onPressed,
      shape: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "Proceed",
              maxLines: 1,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }