import 'package:auto_route/auto_route.dart';
import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/app_router/route_import.gr.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/services/event_service.dart';
import 'package:byrahul/services/speaker_service.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget customCardWidget(
    {required String imagePath,
    required String name,
    String? position,
    String? link,
    required BuildContext context,
    required String description,
    required String id}) {
  return Stack(children: [
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

      // borderOnForeground: true,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(1, 1),
                color: Colors.grey)
          ]),
      // shadowColor: Colors.black,
      // shape: cardShape,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imagePath.validateApiUri(),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Row(
              children: [
                customText(text: name, colour: Palette.primary),
                const Spacer(),
                customText(
                    text: position ?? '',
                    colour: Palette.primary.withOpacity(0.7))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: customText(
                putPadding: true,
                text: description,
                fontSize: 15,
                colour: Colors.grey.shade400),
          )
        ],
      ),
    ),
    Positioned(
      top: 35,
      left: 35,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: 105,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: Offset(0.25, 1),
                  color: Colors.grey)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  if (link == null) {
                    SpeakerService.deleteSpeaker(id: id).then(
                      (value) {
                        Provider.of<MainProvider>(context, listen: false)
                            .deleteSpeaker(id: id);
                      },
                    );
                    ;
                  } else {
                    EventService.deletedEvent(id: id, context: context).then(
                      (value) {
                        Provider.of<MainProvider>(context, listen: false)
                            .deleteEvents(id: id);
                      },
                    );
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.grey,
                  size: 25,
                )),
            customText(text: '|', fontSize: 25, colour: Colors.grey),
            IconButton(
                onPressed: () {
                  if (link == null) {
                    context.router.push(CustomEditorPageRoute(
                      appbarTitle: 'Edit Speaker',
                      id: id,
                      imagePath: imagePath,
                    ));
                  } else {
                    context.router.push(CustomEditorPageRoute(
                        appbarTitle: 'Edit Event',
                        linkExist: true,
                        id: id,
                        event: true,
                        imagePath: imagePath));
                  }
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.grey,
                  size: 28,
                )),
          ],
        ),
      ),
    ),
  ]);
}
