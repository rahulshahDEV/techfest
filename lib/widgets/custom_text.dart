import 'package:byrahul/utils/themes/palette.dart';
import 'package:flutter/material.dart';

Widget customText(
    {required String text,
    double fontSize = 18,
    bool toCapitalize = false,
    bool fontBold = true,
    bool putPadding = false,
    TextAlign? align,
    Color? colour,
    int maxline = 1}) {
  return Padding(
    padding: putPadding
        ? const EdgeInsets.symmetric(horizontal: 25, vertical: 8)
        : const EdgeInsets.all(0),
    child: Text(
      textAlign: align,
      toCapitalize ? text.toUpperCase() : text,
      maxLines: maxline,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: colour ?? Palette.territory_white,
          fontWeight: fontBold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize),
    ),
  );
}
