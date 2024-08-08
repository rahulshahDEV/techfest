import 'package:auto_route/auto_route.dart';
import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/app_router/route_import.gr.dart';
import 'package:byrahul/model/userView_model.dart' as userhome;
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';

Widget sponsorsCard(
    {required userhome.UserviewHome userhome,
    required int index,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      context.router.push(UserDetailedRoute(
          title: userhome.sponsors[index].link,
          imagePath: userhome.sponsors[index].sponsorImage.url,
          name: userhome.sponsors[index].name,
          position: userhome.sponsors[index].level.toString(),
          description: userhome.sponsors[index].description,
          //  linkedin: userhome.sponsors[index].level.id!.toString(),
          tag: userhome.sponsors[index].sponsorImage.name));
    },
    child: Stack(clipBehavior: Clip.hardEdge, children: [
      Container(
        clipBehavior: Clip.hardEdge,
        height: 120,
        width: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: Image.network(
          fit: BoxFit.cover,
          userhome.sponsors[index].sponsorImage.url,
          errorBuilder: (context, error, stackTrace) => Image.network(
            'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        child: Container(
          // clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            color: Palette.primary,
          ),
          width: 120,
          height: 40,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: customText(
                fontSize: 14,
                text: userhome.sponsors[index].name,
                maxline: 1,
                align: TextAlign.center),
          ),
        ),
      )
    ]),
  );
}
