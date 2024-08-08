import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:byrahul/model/blogSlug_model.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/services/blog_service.dart';
import 'package:byrahul/utils/helper_methods/custom_button.dart';
import 'package:byrahul/utils/helper_methods/editor_textfield.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/appbar.dart';
import 'package:byrahul/widgets/editor_toolbar.dart';
import 'package:byrahul/widgets/textfield_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

@RoutePage()
class Blogeditor extends StatefulWidget {
  Blogeditor({super.key, this.slug, this.imgUrl, this.id});
  final String? slug;
  final String? imgUrl;
  final String? id;

  @override
  State<Blogeditor> createState() => _BlogeditorState();
}

class _BlogeditorState extends State<Blogeditor> {
  final QuillController _controller = QuillController.basic();
  final TextEditingController title = TextEditingController();
  final TextEditingController excerpt = TextEditingController();
  @override
  void initState() {
    super.initState();
    // String? slug = Provider.of<EditorProvider>(context, listen: false).slug;
    // Fetch the blog data asynchronously
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getDataIfExist();
    });
  }

  void getDataIfExist() {
    if (widget.slug != null) {
      Provider.of<MainProvider>(context, listen: false).setLoadingEditor(true);

      BlogService.getBlogBySlug(widget.slug!).then((GetBlogBySlug? blogData) {
        if (blogData != null) {
          title.text = blogData.title + title.text;
          excerpt.text += blogData.excerpt;
          if (blogData.content.contains('insert')) {
            final json = jsonDecode(blogData.content);
            _controller.document = Document.fromJson(json);
          }
          Provider.of<MainProvider>(context, listen: false)
              .setLoadingEditor(false);
        }
      });
    } else {
      Provider.of<MainProvider>(context, listen: false)
          .setImagePreview(image: null);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    title.dispose();
    excerpt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final File? imageFile = context.watch<MainProvider>().imagePreviewPath;
    return Scaffold(
      // backgroundColor: Palette.primary,
      appBar: const MyAppBar(title: 'Editor'),
      // backgroundColor: Palette.territory_white,
      body: Consumer<MainProvider>(
          builder: (context, value, child) => widget.slug != null &&
                  value.isLoadingEditorPage
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListView(children: [
                    EditorTextfield(
                      hintText: 'Title',
                      controller: title,
                    ),
                    EditorTextfield(
                      hintText: 'Excrept',
                      controller: excerpt,
                    ),
                    widget.imgUrl != null || imageFile != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(
                                20), // Same radius as container
                            child: imageFile != null
                                ? Image.file(
                                    imageFile,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    widget.imgUrl!,
                                    fit: BoxFit
                                        .cover, // Optional for image scaling
                                  ),
                          )
                        : Container(),
                    GestureDetector(
                      onTap: () {
                        BlogService.pickIMAGE(context: context);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: Palette.primary,
                            borderRadius: BorderRadius.circular(10)),
                        // height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.upload_file),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Featured Image',
                              style: TextStyle(color: Palette.territory_white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Palette.primary),
                          borderRadius: BorderRadius.circular(28)),
                      child: Column(
                        children: [
                          editorToolbar(controller: _controller),
                          textfieldToolBar(controller: _controller)
                        ],
                      ),
                    ),
                    CustomButton(
                      height: 60,
                      setMargin: true,
                      label: 'Submit',
                      onPressed: () {
                        final blogData =
                            jsonEncode(_controller.document.toDelta().toJson());

                        if (widget.slug == null) {
                          BlogService.postBlogData(
                                  context: context,
                                  title: title.text,
                                  excrept: excerpt.text,
                                  blogdata: blogData)
                              .then(
                            (value) => context.router.pushNamed('/blog'),
                          );
                        } else {
                          BlogService.updateBlog(
                                  context: context,
                                  path: widget.imgUrl!,
                                  id: widget.id!,
                                  title: title.text,
                                  excrept: excerpt.text,
                                  blogdata: blogData)
                              .then(
                            (value) {
                              context.router.pushNamed('/blog');
                            },
                          );
                        }
                      },
                      icon: Icons.rocket,
                    )
                  ]),
                )),
    );
  }
}
