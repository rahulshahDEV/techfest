import 'package:auto_route/auto_route.dart';
import 'package:byrahul/pages/userview/user_appbar.dart';
import 'package:byrahul/pages/userview/user_blog.dart';
import 'package:byrahul/pages/userview/user_dashboard.dart';
import 'package:byrahul/pages/userview/user_event.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/login_widget.dart';
import 'package:byrahul/widgets/tabbar.dart';
import 'package:byrahul/widgets/user_team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';

@RoutePage()
class UserHomepage extends StatefulWidget {
  UserHomepage({super.key});

  @override
  State<UserHomepage> createState() => _UserHomepageState();
}

class _UserHomepageState extends State<UserHomepage> {
  final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();

  void isDrawerEnabled() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = context.watch<MainProvider>().selectedIndex;
    List<Widget> widgetOptions = <Widget>[
      userDashboard(),
      userBlog(context),
      userEvent(context),
      teamMember(),
      const LoginWidget()
    ];

    return Scaffold(
      appBar: selectedIndex != 4 ? const UserAppbar() : null,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const Tabbar(),
      ),
      body: Center(child: widgetOptions.elementAt(selectedIndex)),
    );
  }
}

class userview_drawer extends StatelessWidget {
  const userview_drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Palette.primary,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 50)
            .copyWith(left: 20, bottom: 35),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
              width: 2,
            )),
      ),
    );
  }
}
