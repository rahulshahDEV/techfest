import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/model/dashboard.dart';
import 'package:byrahul/utils/helper_methods/custom_Dashboard_Card.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';

Widget latestWidget(Dashboard dashboard) {
  final List<Blog> blogs = dashboard.blogs;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20,
        ),
        customText(text: 'Latest Blogs', colour: Palette.primary, fontSize: 22),
        ...blogs.map(
          (e) => CustomDashboardCard(
            slug: e.slug,
            featuredImage: e.featuredImage.url.validateApiUri(),
            title: e.title,
            id: e.id,
          ),
        )
      ],
    ),
  );
}
