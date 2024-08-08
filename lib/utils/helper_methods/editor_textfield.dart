import 'package:byrahul/utils/themes/palette.dart';
import 'package:flutter/material.dart';

class EditorTextfield extends StatelessWidget {
  const EditorTextfield(
      {super.key, required this.hintText, required this.controller});
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: TextField(
        style: const TextStyle(fontSize: 22),
        controller: controller,
        decoration: InputDecoration(
            labelText: hintText,
            labelStyle: TextStyle(color: Palette.primary),
            // hintText: hintText,
            hintStyle: const TextStyle(fontSize: 22)),
      ),
    );
  }
}
