import 'package:auto_route/auto_route.dart';
import 'package:byrahul/pages/homescreen.dart';
import 'package:byrahul/pages/userview/user_homepage.dart';
import 'package:flutter/material.dart';
import 'package:byrahul/services/auth/auth_service.dart';

@RoutePage()
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Controller.getToken(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return UserHomepage(); // Or a loading indicator while fetching
        }
      },
    );
  }
}
