import 'package:auto_route/auto_route.dart';
import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/app_router/route_import.gr.dart';
import 'package:byrahul/pages/blogeditor.dart';
import 'package:byrahul/provider/editor_provider.dart';
import 'package:byrahul/services/blog_service.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {super.key,
      required this.slug,
      required this.id,
      required this.description,
      required this.index,
      required this.featuredImage,
      required this.title});
  final String title;
  final String description;
  final String featuredImage;
  final String slug;
  final String id;
  final int index;

  final BoxDecoration decoration = BoxDecoration(
      color: Palette.primary, borderRadius: BorderRadius.circular(15));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(BlogDetailRoute(
            slug: slug, imagepath: featuredImage.validateApiUri()));
      },
      child: Stack(alignment: Alignment.center, children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          clipBehavior: Clip.hardEdge,
          height: 250,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, 1),
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 1,
                    spreadRadius: 1),
              ],
              borderRadius: BorderRadius.circular(25),
              color: Palette.territory_white),
          child: LayoutBuilder(
            builder: (context, constraints) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.7,
                  width: constraints.maxWidth,
                  child: Image.network(
                    featuredImage.validateApiUri(),
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: customText(
                      maxline: 2,
                      text: description,
                      colour: Colors.black,
                      putPadding: true,
                      fontSize: 20),
                )
              ],
            ),
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
                      BlogService.deleteBlog(
                          id: id, context: context, index: index);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.grey,
                      size: 25,
                    )),
                customText(text: '|', fontSize: 25, colour: Colors.grey),
                IconButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => Blogeditor(
                      //     id: id,
                      //     imgUrl: featuredImage.validateApiUri(),
                      //     slug: slug,
                      //   ),
                      // ));
                      context.router.push(BlogeditorRoute(
                          slug: slug,
                          imgUrl: featuredImage.validateApiUri(),
                          id: id));
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
      ]),
    );
  }
}
