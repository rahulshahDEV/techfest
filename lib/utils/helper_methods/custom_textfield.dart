import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/constant.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield(
      {super.key,
      required this.prefixIcon,
      this.postfixIcon,
      required this.label,
      required this.validator,
      this.suffixIconExist = false,
      required this.controller});

  final IconData prefixIcon;
  final IconData? postfixIcon;
  final String label;
  final bool? suffixIconExist;
  final String? Function(String?) validator;

  final TextEditingController controller;

  final OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Palette.primary));

  @override
  Widget build(BuildContext context) {
    final bool isPasswordVisible =
        context.watch<MainProvider>().isPasswordNotVisible;

    return TextFormField(
        validator: (value) => validator(value),
        cursorColor: Palette.primary,
        style: TextStyle(color: Palette.primary),
        controller: controller,
        obscureText: suffixIconExist == true && isPasswordVisible,
        decoration: InputDecoration(
            label: Text(
              label,
              style: TextStyle(color: Palette.primary),
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: Palette.primary,
            ),
            border: borderStyle,
            focusedBorder: borderStyle,
            enabledBorder: borderStyle));
  }
}
