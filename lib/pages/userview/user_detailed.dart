import 'package:auto_route/auto_route.dart';
import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/services/speaker_service.dart';
import 'package:byrahul/services/userview_service.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/appbar.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserDetailed extends StatefulWidget {
  const UserDetailed(
      {super.key,
      this.id,
      this.count,
      this.description,
      this.facebook,
      this.imagePath,
      this.position,
      this.linkedin,
      this.maxline,
      this.priority,
      this.name,
      this.title,
      this.tag,
      this.twitter,
      this.lin,
      this.type});

  final String? id;
  final String? title;
  final String? imagePath;
  final String? description;
  final String? name;
  final String? position;
  final int? maxline;
  final int? type;
  final String? facebook;
  final String? twitter;
  final String? linkedin;
  final String? priority;
  final int? count;
  final String? lin;
  final String? tag;

  @override
  State<UserDetailed> createState() => _UserDetailedState();
}

class _UserDetailedState extends State<UserDetailed> {
  @override
  void initState() {
    super.initState();
    UserViewService.getUserHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const MyAppBar(title: 'Detailed View'),
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
          child: (widget.imagePath != null)
              ? SizedBox(
                  width: double.infinity,
                  child: Hero(
                      tag: widget.tag ?? 'jk',
                      child: Image.network(
                        widget.imagePath!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.network(
                          'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
                          fit: BoxFit.cover,
                        ),
                      )),
                )
              : null,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 1,
            // width: double.infinity,
            // height: double.infinity,
            decoration: const BoxDecoration(
                // color: Palette.primary,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5, color: Colors.grey, offset: Offset(1, 1)),
                  BoxShadow(
                      blurRadius: 5, color: Colors.grey, offset: Offset(-1, -1))
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.title != null)
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 22),
                          children: [
                        TextSpan(
                            text: 'Title : ',
                            style: TextStyle(
                                color: Palette.primary,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: widget.title,
                        )
                      ])),
                const SizedBox(
                  height: 20,
                ),
                if (widget.name != null)
                  Row(
                    children: [
                      customText(text: 'name : ', colour: Palette.primary),
                      customText(
                        text: widget.name!,
                        colour: Colors.black,
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                if (widget.description != null)
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 22),
                          children: [
                        TextSpan(
                            text: 'Description : ',
                            style: TextStyle(
                                color: Palette.primary,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: widget.description,
                        )
                      ])),
                // Row(
                //   children: [
                //     customText(
                //         text: 'Description : ', colour: Palette.primary),
                //     Flexible(
                //       child: customText(
                //           maxline: 20,
                //           text: widget.description!,
                //           colour: Colors.black),
                //     )
                //   ],
                // ),
                const SizedBox(
                  height: 20,
                ),
                if (widget.position != null)
                  Row(
                    children: [
                      customText(
                          text: widget.tag == null ? 'Date : ' : 'Position : ',
                          colour: Palette.primary),
                      customText(text: widget.position!, colour: Colors.black),
                    ],
                  )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
