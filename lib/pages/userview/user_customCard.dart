import 'package:auto_route/auto_route.dart';
import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/app_router/route_import.gr.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget userCustomCard(
    {String? id,
    String? title,
    String? imagePath,
    String? description,
    String? name,
    String? position,
    int? maxline,
    int? type,
    String? facebook,
    twitter,
    linkedin,
    String? priority,
    required BuildContext context,
    int? count,
    String? link}) {
  return GestureDetector(
    onTap: () {
      context.router.push(UserDetailedRoute(
          imagePath: imagePath,
          title: title,
          description: description,
          position: position,
          name: name));
    },
    child: type == 1
        ? Container(
            padding: const EdgeInsets.all(3.5),
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 3.5, color: Palette.primary),
              color: Palette.territory_white,
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                fit: BoxFit.cover,
                imagePath!.validateApiUri(),
                errorBuilder: (context, error, stackTrace) => Image.network(
                  'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        : type == 2
            ? Stack(clipBehavior: Clip.hardEdge, children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  height: 120,
                  width: 120,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  child: Image.network(
                    fit: BoxFit.cover,
                    imagePath!.validateApiUri(),
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
                          text: title!,
                          maxline: 1,
                          align: TextAlign.center),
                    ),
                  ),
                )
              ])
            : Container(
                clipBehavior: Clip.hardEdge,
                height: type != 1 ? 350 : 120,
                width: type != 1 ? 300 : 120,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 1,
                          spreadRadius: 1),
                    ],
                    borderRadius: type == 1
                        ? BorderRadius.circular(50)
                        : BorderRadius.circular(25),
                    color: Palette.territory_white),
                child: LayoutBuilder(
                  builder: (context, constraints) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (imagePath != null)
                        SizedBox(
                          height: constraints.maxHeight * 0.6,
                          width: constraints.maxWidth,
                          child: Image.network(
                            fit: BoxFit.cover,
                            imagePath.validateApiUri(),
                            errorBuilder: (context, error, stackTrace) => Hero(
                              tag: 'backgound',
                              child: Image.network(
                                'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      if (!(type == 1))
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (position != null)
                                customText(
                                  text: position,
                                  colour: Colors.red,
                                  fontSize: 12,
                                ),
                              if (title != null)
                                customText(
                                    maxline: maxline ?? 1,
                                    text: title,
                                    colour: Colors.black,
                                    fontSize: 20),
                              if (description != null)
                                customText(
                                    maxline: 2,
                                    text: description,
                                    colour: Colors.black.withOpacity(0.6))
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
  );
}

// class kdfkj {
//   Widget dklfhkjd() {
//     return Divider();
//   }
// }
