import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget connectivityWidget() {
  return Center(
    child: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.signal_wifi_connected_no_internet_4,
            size: 70,
            color: const Color.fromARGB(255, 243, 23, 7),
          ),
          customText(text: 'No Internet', colour: Colors.red, putPadding: true),
        ],
      ),
    ),
  );
}
