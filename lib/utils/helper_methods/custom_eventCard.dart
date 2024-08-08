import 'package:byrahul/model/dashboard.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:byrahul/widgets/event_card.dart';
import 'package:flutter/material.dart';

class CustomEventcard extends StatelessWidget {
  const CustomEventcard({super.key, required this.dashboard});

  final Dashboard dashboard;

  @override
  Widget build(BuildContext context) {
    final List<Event> events = dashboard.events;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        customText(text: 'Events', colour: Palette.primary, fontSize: 22),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...events.map(
                (e) => eventCard(image: e.eventImage.url, title: e.title),
              ),
              // ...events.map(
              //   (e) => eventCard(image: e.eventImage.url, title: e.title),
              // )
            ],
          ),
        ),
      ]),
    );
  }
}
