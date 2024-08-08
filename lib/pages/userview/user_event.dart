import 'package:byrahul/model/event_model.dart';
import 'package:byrahul/pages/userview/user_customCard.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/services/blog_service.dart';
import 'package:byrahul/services/event_service.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:byrahul/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget userEvent(BuildContext context) {
  return FutureBuilder(
      future: EventService.getFrontendEvent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: userCustomCard(
                context: context,
                title: snapshot.data![index]['title'],
                imagePath: snapshot.data![index]['eventImage']['url'],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return errorWidget(error: snapshot.error.toString());
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Palette.primary,
            ),
          );
        }
      });
}
