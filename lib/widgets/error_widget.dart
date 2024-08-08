import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';

Widget errorWidget({required String error}) {
  return SizedBox(
    height: 200,
    width: 200,
    child: Center(
      child: customText(text: error),
    ),
  );
}
