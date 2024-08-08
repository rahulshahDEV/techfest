import 'package:byrahul/model/dashboard.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:byrahul/widgets/workshop_card.dart';
import 'package:flutter/material.dart';

class WorkshopWidget extends StatelessWidget {
  const WorkshopWidget({super.key, required this.dashboard});
  final Dashboard dashboard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(text: 'Workshops', colour: Palette.primary, fontSize: 22),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...dashboard.workshops.map(
                  (e) => workshopCard(
                      imagePath: e.workshopImage.url, title: e.title),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
