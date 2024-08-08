import 'package:auto_route/auto_route.dart';
import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/app_router/route_import.gr.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:byrahul/model/userView_model.dart' as userhome;
import 'package:flutter/widgets.dart';

Widget speakerCard(
    {required userhome.UserviewHome userhome,
    required int index,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      context.router.push(UserDetailedRoute(
          imagePath: userhome.speakers[index].speakerImage.url.validateApiUri(),
          description: userhome.speakers[index].description,
          tag: userhome.speakers[index].speakerImage.name,
          position: userhome.speakers[index].position,
          name: userhome.speakers[index].name));
    },
    child: Container(
      clipBehavior: Clip.hardEdge,
      height: 350,
      width: 300,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 1,
                spreadRadius: 1),
          ],
          borderRadius: BorderRadius.circular(25),
          color: Palette.territory_white),
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.6,
              width: constraints.maxWidth,
              child: Hero(
                tag: userhome.speakers[index].speakerImage.name,
                child: Image.network(
                  userhome.speakers[index].speakerImage.url.validateApiUri(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    text: userhome.speakers[index].position,
                    colour: Colors.red,
                    fontSize: 12,
                  ),
                  customText(
                      maxline: 1,
                      text: userhome.speakers[index].name,
                      colour: Colors.black,
                      fontSize: 20),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
