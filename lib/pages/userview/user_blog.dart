import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/pages/userview/user_customCard.dart';
import 'package:byrahul/services/blog_service.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/error_widget.dart';
import 'package:flutter/material.dart';

Widget userBlog(BuildContext context) {
  return FutureBuilder(
    future: BlogService.getBlogs(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          itemCount: snapshot.data!.blogs.length,
          itemBuilder: (context, index) => Container(
            height: 400,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: userCustomCard(
                maxline: 2,
                position: snapshot.data!.blogs[index].createdAt
                    .toString()
                    .substring(0, 10),
                context: context,
                title: snapshot.data!.blogs[index].title,
                id: snapshot.data!.blogs[index].id,
                description: snapshot.data!.blogs[index].excerpt,
                imagePath: snapshot.data!.blogs[index].featuredImage.url
                    .validateApiUri()),
          ),
        );
      } else if (snapshot.hasError) {
        return errorWidget(error: snapshot.error.toString());
      } else {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Center(
            child: CircularProgressIndicator(
              color: Palette.primary,
            ),
          ),
        );
      }
    },
  );
}
