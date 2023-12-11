import 'package:flutter/material.dart';

Widget customButton(
    {required String btnName,
      required Color borderColor,
      Color? textColor,
      required BuildContext context}) {
  return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(width: 1, color: borderColor)),
        child: Center(
            child: Text(
              btnName,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.9),
            )),
      ));
}