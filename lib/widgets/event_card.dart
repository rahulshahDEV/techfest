import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';

Widget eventCard({required String image, required String title}) {
  return Container(
    clipBehavior: Clip.hardEdge,
    margin: const EdgeInsets.only(right: 15),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.grey,
              offset: Offset(0.5, 0.5)),
          BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: Palette.territory_white,
              offset: Offset(-1, -1))
        ],
        image: DecorationImage(
            image: NetworkImage(
              image.validateApiUri(),
            ),
            fit: BoxFit.cover),
        color: Palette.primary,
        borderRadius: BorderRadius.circular(25)),
    height: 100,
    width: 100,
  );
}
