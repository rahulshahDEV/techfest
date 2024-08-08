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
    List<IconData> myIcons = [
      Icons.home,
      Icons.newspaper,
      Icons.calendar_month,
      Icons.group,
      Icons.logout
    ];
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
          onTabChange: (index) {
            context.read<MainProvider>().updateTabIndex(index);
          },
          tabs: [
            ...myIcons.map(
              (e) => GButton(
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
