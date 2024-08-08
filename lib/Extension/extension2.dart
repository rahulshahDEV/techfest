import 'package:flutter/material.dart';

extension Extension on BuildContext {
  void showSnackBar(String message, {int myduration = 360}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        backgroundColor: Colors.black,
        duration: Duration(milliseconds: myduration),
        content: Center(
            child: Text(
          message,
          style: const TextStyle(fontSize: 20),
        ))));
  }
}

extension Validator on String {
  bool validateEmail() {
    return RegExp(r'[a-zA-Z0-9\.\-\_]+[@][-\a-z]+[\.][a-z]{2,3}')
        .hasMatch(this);
  }

  bool validatePhone() {
    return RegExp(r'[+][0-9]{3}[-\][0-9]{10}').hasMatch(this);
  }
}
