import 'package:auto_route/auto_route.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/services/auth/auth_service.dart';
import 'package:byrahul/app_router/route_import.gr.dart';
import 'package:byrahul/utils/helper_methods/custom_button.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List menus = [
    {'name': 'Dashboard', 'icon': Icons.menu},
    {'name': 'Blog', 'icon': Icons.newspaper},
    {'name': 'Event', 'icon': Icons.calendar_month},
    // {'name': 'FAQ', 'icon': Icons.lightbulb},
    // // Consider renaming these 'label' items:
    // {'name': 'label', 'icon': Icons.label},
    // {'name': 'Privacy', 'icon': Icons.privacy_tip},
    // {'name': 'Prize', 'icon': Icons.surfing},
    // {'name': 'label', 'icon': Icons.label},

    // New menu items:
    // {'name': 'Resource', 'icon': Icons.folder}, // Or Icons.library_books
    {'name': 'Speaker', 'icon': Icons.mic},
    // {'name': 'Role', 'icon': Icons.person}, // Or Icons.group
    // {'name': 'Sponsor', 'icon': Icons.handshake}, // Or Icons.monetization_on
    // {'name': 'Term', 'icon': Icons.description}, // Or Icons.text_snippet
    // {'name': 'Team', 'icon': Icons.people},
    // {'name': 'Workshop', 'icon': Icons.build}, // Or Icons.handyman
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClipRRect(
          borderRadius: BorderRadius.circular(50), // Optional: rounded corners
          child: Image.network(
            height: 40,
            width: 40,
            'https://static.vecteezy.com/system/resources/previews/004/819/327/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg',
            fit: BoxFit.cover, // Make sure the image covers the container
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Controller.deleteToken(context).then(
                  (value) {
                    // context.watch<MainProvider>().updateTabIndex(0);
                    Provider.of<MainProvider>(context, listen: false)
                        .updateTabIndex(0);
                  },
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: customText(
                  text: 'WELCOME BACK !',
                  fontSize: 25,
                  colour: Palette.primary),
            ),
          ),
          ...menus.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ExpansionTile(
                  minTileHeight: 80,
                  collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  iconColor: Palette.territory_white,
                  collapsedIconColor: Palette.territory_white,
                  backgroundColor: Palette.primary,
                  leading: Icon(e['icon']),
                  title: customText(
                    text: e['name'].toString(),
                  ),
                  collapsedBackgroundColor: Palette.primary,
                  children: [
                    CustomButton(
                      colour: Colors.blueAccent,
                      height: 50,
                      label: 'View ${e['name']} ',
                      onPressed: () {
                        switch (menus.indexOf(e)) {
                          case 0:
                            context.router.pushNamed('/dashboard');
                          case 1:
                            context.router.pushNamed('/blog');
                          case 2:
                            context.router.pushNamed('/event');
                          case 3:
                            context.router.pushNamed('/speaker');
                        }
                      },
                    ),
                    if (e['name'] != 'Dashboard')
                      CustomButton(
                        height: 50,
                        label: 'Add New',
                        onPressed: () {
                          switch (menus.indexOf(e)) {
                            case 1:
                              context.router.pushNamed('/editor');
                            case 2:
                              context.router.push(CustomEditorPageRoute(
                                  appbarTitle: 'Add Event', linkExist: true));
                            case 3:
                              context.router.push(CustomEditorPageRoute(
                                  appbarTitle: 'Add Speaker'));
                          }
                        },
                        colour: Colors.blueAccent,
                      )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
