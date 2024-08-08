import 'package:auto_route/auto_route.dart';
import 'package:byrahul/model/blog_model.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/utils/helper_methods/custom_card.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final ScrollController scrollController = ScrollController();
  int page = 1;

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page += 1;
      Provider.of<MainProvider>(context, listen: false).getBlogs(page: page);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(_scrollListener);
    Provider.of<MainProvider>(context, listen: false).getBlogs(page: page);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Blog> data = context.watch<MainProvider>().blogs;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.pushNamed('/editor');
          },
          child: const Icon(Icons.add),
        ),
        appBar: const MyAppBar(title: 'Blog'),
        body: data.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: Palette.primary,
              ))
            : ListView.builder(
                controller: scrollController,
                itemCount: data.length,
                itemBuilder: (context, index) => Consumer<MainProvider>(
                  builder: (context, value, child) => CustomCard(
                      index: index,
                      id: value.blogs[index].id,
                      slug: value.blogs[index].slug,
                      description: value.blogs[index].excerpt,
                      featuredImage: value.blogs[index].featuredImage.url,
                      title: value.blogs[index].title),
                ),
              ));
  }
}
