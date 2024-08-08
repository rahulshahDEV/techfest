import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAppbar extends StatelessWidget implements PreferredSize {
  const UserAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> title = context.watch<MainProvider>().konsaPage;
    final int index = context.watch<MainProvider>().selectedIndex;
    return AppBar(
      title: Padding(
        padding: EdgeInsets.zero,
        child: customText(
            text: title.elementAt(index),
            fontSize: 25,
            colour: Palette.territory_white.withOpacity(0.9)),
      ),
      centerTitle: true,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(0).copyWith(
      //         bottomLeft: const Radius.circular(50),
      //         bottomRight: const Radius.circular(50))),
    );
    // return AnnotatedRegion<SystemUiOverlayStyle>(
    //   value: SystemUiOverlayStyle.light.copyWith(
    //     statusBarColor: Palette.primary,
    //   ),
    //   child: SafeArea(
    //     child: Container(
    //       height: 60,
    //       padding: const EdgeInsets.symmetric(horizontal: 40),
    //       decoration: BoxDecoration(
    //           color: Palette.primary,
    //           borderRadius: BorderRadius.circular(0).copyWith(
    //               bottomLeft: const Radius.circular(50),
    //               bottomRight: const Radius.circular(50))),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           customText(
    //               text: 'Home',
    //               fontSize: 28,
    //               colour: Palette.territory_white.withOpacity(0.9))
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
