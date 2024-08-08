import 'package:byrahul/services/team_service.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';

Widget teamMember(
    {String? name, String? levelTitle, int? level, String? imagepath}) {
  const List<Color> colours = [
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.green,
    Color.fromARGB(255, 255, 24, 186)
  ];
  return FutureBuilder(
      future: TeamService.getTeam(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.members.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              clipBehavior: Clip.hardEdge,
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(blurRadius: 2, offset: Offset(1, 1))
                  ]),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Palette.primary,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(30).copyWith(top: 80),
                            color: Colors.white,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                    text: snapshot.data!.members[index].name,
                                    colour: Palette.primary,
                                    fontSize: 20),
                                customText(
                                    text: snapshot
                                        .data!.members[index].role.title,
                                    colour: Palette.primary_black)
                              ],
                            )),
                      )
                    ],
                  ),
                  const Positioned(
                    left: 90,
                    top: 30,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60,
                      child: CircleAvatar(
                          radius: 55,
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/abstract-autumn-beauty-multi-colored-leaf-vein-pattern-generated-by-ai_188544-9871.jpg')),
                    ),
                  ),
                  Positioned(
                    top: 105,
                    right: 100,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            colours[snapshot.data!.members[index].role.level],
                        child: customText(
                            text: snapshot.data!.members[index].role.level
                                .toString()),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: Palette.primary,
          ));
        }
      });
}
