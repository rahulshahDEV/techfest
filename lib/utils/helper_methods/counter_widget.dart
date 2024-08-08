import 'package:byrahul/model/dashboard.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/counter.dart';
import 'package:flutter/material.dart';

Widget counterWidget(Dashboard dashboard) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
        color: Palette.primary, borderRadius: BorderRadius.circular(25)),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.,
      children: [
        ...dashboard.counter
            .map((e) => counter(title: e.title, count: e.number))
      ],
    ),
  );
}
