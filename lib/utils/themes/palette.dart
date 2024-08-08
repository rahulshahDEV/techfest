import 'package:flutter/material.dart';

class Palette {
  static final primary = Color(hexColour('#015EB8'));
  static final primary_black = Color(hexColour('#A2B5FB'));
  static final secondary_green = Color(hexColour('#182903'));
  static final territory_white = Color(hexColour('#FFFFFF'));
  static final card_colour = Color(hexColour('#F59F91'));

  static const navButtonColour = LinearGradient(
    colors: [Color(0xff2d9ee0), Color(0xff2d9ee0), Color(0xff2d9ee0)],
    stops: [0, 0.5, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const testColour = LinearGradient(
    colors: [
      Color(0xff5433ff),
      Color.fromRGBO(1, 94, 184, 1),
      Color.fromRGBO(1, 94, 184, 1)
    ],
    stops: [0, 0.5, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // #84894A

  static const scaffoldColour = Colors.white;

  static int hexColour(String hexCode) {
    String newColour = '0xff' + hexCode;
    newColour = newColour.replaceAll('#', '');
    int finalColour = int.parse(newColour);
    // print(finalColour);
    return finalColour;
  }
}
