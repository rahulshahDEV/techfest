import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:byrahul/services/blog_service.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

@RoutePage()
class BlogDetail extends StatelessWidget {
  const BlogDetail({super.key, required this.slug, required this.imagepath});
  final String slug;
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    final QuillController _controller = QuillController.basic();
    return Scaffold(
        body: FutureBuilder(
            future: BlogService.getBlogBySlug(slug),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.content.contains('insert')) {
                  final json = jsonDecode(snapshot.data!.content);
                  _controller.document = Document.fromJson(json);
                }

                return Stack(children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                              color: Palette.primary,
                              image: DecorationImage(
                                  image: NetworkImage(imagepath),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              customText(
                                  text: snapshot.data!.title,
                                  maxline: 20,
                                  fontBold: true,
                                  toCapitalize: true,
                                  colour: Colors.red),
                              const SizedBox(
                                height: 15,
                              ),
                              customText(
                                  text: snapshot.data!.excerpt,
                                  colour: Colors.black,
                                  maxline: 20,
                                  align: TextAlign.start,
                                  fontBold: true),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  child: IgnorePointer(
                                    ignoring: true,
                                    child: QuillEditor.basic(
                                        configurations:
                                            QuillEditorConfigurations(
                                                controller: _controller,
                                                scrollable: true,
                                                showCursor: false,
                                                checkBoxReadOnly: true)),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: IconButton(
                        tooltip: 'blog image',
                        onPressed: () {
                          context.router.maybePop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  )
                ]);
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Palette.primary,
                  ),
                );
              }
            }));
  }
}
