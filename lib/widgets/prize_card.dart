import 'package:auto_route/auto_route.dart';
import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/app_router/route_import.gr.dart';
import 'package:byrahul/model/userView_model.dart' as userhome;
import 'package:byrahul/utils/themes/palette.dart';
import 'package:flutter/material.dart';

Widget prizeCard(
    {required userhome.UserviewHome userhome,
    required int index,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      context.router.push(UserDetailedRoute(
          imagePath: userhome.prizes[index].prizeImage.url.validateApiUri(),
          title: userhome.prizes[index].title,
          description: userhome.prizes[index].description,
          tag: 'jdfhk'));
    },
    child: Container(
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
          userhome.prizes[index].prizeImage.url.validateApiUri(),
          errorBuilder: (context, error, stackTrace) => Image.network(
            'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
