import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/Extension/extension2.dart';
import 'package:byrahul/model/event_model.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/services/blog_service.dart';
import 'package:byrahul/services/event_service.dart';
import 'package:byrahul/services/speaker_service.dart';
import 'package:byrahul/utils/helper_methods/custom_button.dart';
import 'package:byrahul/utils/helper_methods/editor_textfield.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/appbar.dart';
import 'package:byrahul/widgets/dropfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CustomEditorPage extends StatefulWidget {
  const CustomEditorPage(
      {super.key,
      required this.appbarTitle,
      this.id,
      this.event = false,
      this.imagePath = '',
      this.linkExist = false});
  final String appbarTitle;
  final String? id;
  final bool linkExist;
  // final String? link;
  final bool event;
  final String imagePath;

  @override
  State<CustomEditorPage> createState() => _CustomEditorState();
}

class _CustomEditorState extends State<CustomEditorPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController position = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController status = TextEditingController();
  // final TextEditingController image = TextEditingController();
  final TextEditingController facebook = TextEditingController();

  final TextEditingController twitter = TextEditingController();
  final TextEditingController linkedin = TextEditingController();
  // String imagePath = '';
  // SpeakerElement? response ;
  // final ValueNotifier<String> imagePath = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getDataIfExist();
    });
  }

  void getDataIfExist() {
    if (widget.event) {
      Provider.of<MainProvider>(context, listen: false).setLoadingEvent(true);
      try {
        EventService.getEventById(id: widget.id!).then(
          (value) {
            if (value != null) {
              name.text = value.title;
              description.text = value.description;
              position.text = value.link;
              status.text = value.status;
            }

            Provider.of<MainProvider>(context, listen: false)
                .setLoadingEvent(false);
          },
        );
      } catch (e) {
        context.showSnackBar("Somthing went wrong !");
      }
    } else {
      Provider.of<MainProvider>(context, listen: false)
          .setImagePreview(image: null);
    }

    if (widget.id != null && widget.linkExist == false) {
      Provider.of<MainProvider>(context, listen: false).setLoadingSpeaker(true);
      try {
        SpeakerService.getSpeakerById(id: widget.id!).then(
          (value) {
            name.text = value!.name;
            position.text = value.position;
            description.text = value.description!;
            facebook.text = value.facebook;
            twitter.text = value.twitter;
            linkedin.text = value.linkedin;
            Provider.of<MainProvider>(context, listen: false)
                .setLoadingSpeaker(false);
          },
        );
      } catch (e) {
        context.showSnackBar("Something went wrong !");
      }
    } else {
      Provider.of<MainProvider>(context, listen: false)
          .setImagePreview(image: null);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    name.dispose();
    position.dispose();
    description.dispose();
    facebook.dispose();
    twitter.dispose();
    linkedin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final File? fileImage = context.watch<MainProvider>().imagePreviewPath;

    final bool isLoadingEvent =
        context.watch<MainProvider>().isLoadingEventPage;
    final bool isLoadingSpeaker =
        context.watch<MainProvider>().isLoadingSpeeakerPage;

    final String status = context
        .watch<MainProvider>()
        .status
        .toString()
        .replaceAll('Status.', '');

    return Scaffold(
      appBar: MyAppBar(title: widget.appbarTitle),
      body: widget.linkExist && isLoadingEvent || isLoadingSpeaker
          ? Center(
              child: CircularProgressIndicator(
                color: Palette.primary,
              ),
            )
          : Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    if (widget.imagePath.isNotEmpty)
                      Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child:
                              Image.network(widget.imagePath.validateApiUri()))
                    else if (fileImage != null)
                      Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Image.file(fileImage)),
                    CustomButton(
                      setMargin: true,
                      height: 50,
                      label: 'upload image',
                      onPressed: () {
                        if (widget.linkExist) {
                          EventService.Pickimage(context: context);
                        } else {
                          SpeakerService.Pickimage(context: context);
                        }
                      },
                      icon: Icons.upload,
                    ),
                    EditorTextfield(
                        hintText: widget.linkExist ? 'Title' : 'Name',
                        controller: name),
                    EditorTextfield(
                        hintText: 'Description', controller: description),
                    const SizedBox(height: 40, child: Dropfield()),
                    EditorTextfield(
                        hintText: widget.linkExist ? 'link' : 'Position',
                        controller: position),
                    if ((!widget.linkExist)) ...[
                      EditorTextfield(
                          hintText: 'Facebook', controller: facebook),
                      EditorTextfield(hintText: 'Twitter', controller: twitter),
                      EditorTextfield(
                          hintText: 'LinkedIn', controller: linkedin),
                    ],
                    CustomButton(
                      height: 55,
                      setMargin: true,
                      label: 'Submit',
                      onPressed: () {
                        if (widget.linkExist) {
                          EventService.addEvent(
                                  context: context,
                                  link: position.text,
                                  title: name.text,
                                  description: description.text,
                                  status: status)
                              .then(
                            (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Added')));
                              context.router.pushNamed('/event');
                            },
                          );
                          ;
                        } else {
                          if (widget.id != null) {
                            SpeakerService.updatedSpeakerId(
                                    id: widget.id!,
                                    name: name.text,
                                    position: position.text,
                                    description: description.text,
                                    status: status,
                                    facebook: facebook.text,
                                    imagePath: widget.imagePath,
                                    twitter: twitter.text,
                                    Linkedin: linkedin.text)
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('modified')));
                              context.router.pushNamed('/speaker');
                            });
                          } else {
                            SpeakerService.postData(
                                    name: name.text,
                                    position: position.text,
                                    description: description.text,
                                    status: status,
                                    facebook: facebook.text,
                                    twitter: twitter.text,
                                    Linkedin: linkedin.text)
                                .then(
                              (value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Added')));
                                context.router.pushNamed('/speaker');
                              },
                            );
                          }
                        }
                      },
                      icon: Icons.bolt,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
