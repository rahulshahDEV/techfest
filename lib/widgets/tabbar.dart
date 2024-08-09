import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<MainProvider>().selectedIndex;
    final data = context.watch<MainProvider>().konsaPage;
    List<IconData> myIcons = context.watch<MainProvider>().myIcons;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GNav(
          gap: 10,
          backgroundColor: Palette.primary,
          tabBackgroundGradient: Palette.navButtonColour,
          tabMargin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0)
              .copyWith(bottom: 10, top: 10),
          // tabBackgroundColor: Palette.primary,
          haptic: true,
          textStyle: TextStyle(color: Palette.territory_white),
          selectedIndex: selectedIndex,
          onLongPress: () {
            print('hello');
          },
          onTabChange: (index) {
            context.read<MainProvider>().updateTabIndex(index);
          },
          tabs: [
            ...myIcons.map(
              (e) => GButton(
                onLongpress: () {
                  // myIcons.add(Icons.logout);
                  print('hello');

                  // context.read<MainProvider>().addKonsaPage(page: 'login');
                  print('hello');
                },
                icon: e,
                text: data.elementAt(myIcons.indexOf(e)),
                gap: 5,
                padding: const EdgeInsets.all(10),
              ),
            )
          ],
        ));
  }
}
