import 'package:byrahul/utils/themes/palette.dart';
import 'package:flutter/material.dart';

Widget counter({required String title, required int count}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Palette.territory_white, fontSize: 22),
        ),
        // const Divider(
        //   color: Colors.white,
        //   height: 2,
        //   thickness: 2,
        //   indent: 2,
        // ),
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.yellow,
          child: Text(
            count.toString(),
            style: TextStyle(
                color: Palette.primary,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}
