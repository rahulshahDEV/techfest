import 'dart:io';

import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UsercardWidget extends StatelessWidget {
  const UsercardWidget(
      {super.key,
      this.id,
      this.count,
      this.description,
      this.fb,
      this.imagePath,
      this.link,
      this.linkedin,
      this.name,
      this.position,
      this.priority,
      this.title,
      required this.checkCase,
      this.twitter});

  final String? id;
  final String? title;
  final String? imagePath;
  final String? description;
  final String? name;
  final String? position;
  final String? fb, twitter, linkedin;
  final int? priority, count;
  final String? link;
  final int checkCase;

  @override
  Widget build(BuildContext context) {
    switch (checkCase) {
      case 1:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Palette.primary,
          ),

          margin: const EdgeInsets.symmetric(vertical: 10),
          // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          // color: Palette.primary,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: 80,
                child: Image.network(
                  imagePath!.validateApiUri(),
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(text: title!),
                      customText(text: description!, fontSize: 15)
                    ]),
              ),
            ],
          ),
        );
      case 2:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }
}
