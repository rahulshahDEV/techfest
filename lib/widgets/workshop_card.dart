import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:flutter/material.dart';

Widget workshopCard({required String imagePath, required String title}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, right: 18),
    child: CircleAvatar(
      backgroundColor: Palette.primary,
      radius: 48,
      child: CircleAvatar(
        radius: 45,
        backgroundImage: NetworkImage(imagePath.validateApiUri()),
        backgroundColor: Palette.primary,
      ),
    ),
  );
}
