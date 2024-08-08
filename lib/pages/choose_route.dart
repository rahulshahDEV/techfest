import 'package:auto_route/auto_route.dart';
import 'package:byrahul/utils/helper_methods/custom_button.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChooseRoute extends StatelessWidget {
  const ChooseRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customText(
                text: 'login as',
                colour: Palette.territory_white,
                fontSize: 40),
            const SizedBox(
              height: 100,
            ),
            CustomButton(
              label: 'user view',
              onPressed: () {
                context.router.replaceNamed('/userhome');
              },
              icon: Icons.person,
            ),
            CustomButton(
                icon: Icons.supervised_user_circle,
                label: 'admin ',
                onPressed: () {
                  context.router.pushNamed('/wrapper');
                })
          ],
        ),
      ),
    );
  }
}
