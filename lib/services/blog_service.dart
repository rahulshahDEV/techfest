import 'dart:io';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:byrahul/Extension/extension2.dart';
import 'package:byrahul/constant.dart';
import 'package:byrahul/model/blogSlug_model.dart';
import 'package:byrahul/model/blog_model.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/services/auth/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';

class BlogService {
  static int pageCount = 1;

  static final ImagePicker _picker = ImagePicker();
  static File? imagePreviewPath;
  static String? Path;

  static Future<void> deleteBlog(
      {String? id, required BuildContext context, required int index}) async {
    try {
      if (id != null) {
        await dio.delete('$URI/blog/$id').then(
          (value) {
            if (value.statusCode == 200) {
              context.read<MainProvider>().deleteBlogs(index: index);
              context.showSnackBar(value.data['message'] ?? 'Deleted !');
            } else {
              context.showSnackBar('something wen\'t wrong');
            }
          },
        );
      }
    } catch (e) {
      if (context.mounted) {
        context.showSnackBar('something wen\'t wrong');
      }
    }
  }

  static Future<void> updateBlog(
      {String? id,
      required String title,
      required String excrept,
      String? image,
      required BuildContext context,
      required dynamic blogdata}) async {
    try {
      if (id != null) {
        // final token = await Controller.getToken();

        final formData = FormData.fromMap({
          "title": title,
          "excerpt": excrept,
          "content": blogdata,
          "status": "Draft",
          if (image != null)
            "image": await MultipartFile.fromFile(
              image,
              contentType: MediaType.parse('image/jpg'),
            )
        });

        await dio
            .patch(
                data: formData,
                '$URI/blog/$id',
                options: Options(
                  headers: {'Content-Type': 'multipart/form-data'},
                ))
            .then(
              (value) => context.showSnackBar(
                  value.data['message'] ?? 'succesfully updated blog !'),
            );
      }
    } catch (e) {
      print(e.toString());
      if (context.mounted) {
        context.showSnackBar("something went wrong !");
      }
    }
  }

  static Future<BlogModel?> getBlogs({int page = 1}) async {
    // int itemCount = Provider.of<MainProvider>(context, listen: false).items;

    try {
      var response = await dio.get('$URI/blog?per_page=10&page=$page');
      final blogResponse = BlogModel.fromJson(response.data);
      // AutoRouter()

      // print(blogResponse.blogs);

      return blogResponse;
    } catch (e) {
      print(e);
      print('catche');
      return null;
    }
  }

  static Future<GetBlogBySlug?> getBlogBySlug(String slug) async {
    // final String slug = context.watch<EditorProvider>().slug;
    try {
      var response = await dio.get('$URI/blog/$slug');
      final blogResponse = GetBlogBySlug.fromJson(response.data);
      print(blogResponse.content);
      return blogResponse;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static setPath(String mpath) {
    Path = mpath;
  }

  static Future<void> pickIMAGE({required BuildContext context}) async {
    try {
      var pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      await setPath(pickedImage!.path);
      imagePreviewPath = File(pickedImage.path);
      context.read<MainProvider>().setImagePreview(image: imagePreviewPath!);
      // return pickedImage;
    } catch (e) {
      print(e);
      // return null;
    }
  }

  static Future<void> postBlogData(
      {required String title,
      required BuildContext contexxt,
      required String excrept,
      required String image,
      required dynamic blogdata}) async {
    try {
      contexxt.read<MainProvider>().updateLoadingSubmitStatus(status: true);
      final formData = FormData.fromMap({
        "title": title,
        "image": await MultipartFile.fromFile(
          image,
          contentType: MediaType.parse('image/jpg'),
        ),
        "excerpt": excrept,
        "content": blogdata,
        "status": "Published"
      });
      await dio.post('$URI/blog/create', data: formData).then(
        (value) {
          print(value);
          if (value.data['success']) {
            contexxt.showSnackBar(value.data['message'], myduration: 2000);
            contexxt
                .read<MainProvider>()
                .updateLoadingSubmitStatus(status: false);
            // Provider.of<MainProvider>(contexxt, listen: false)
            //     .updateLoadingSubmitStatus(status: false);
          }
        },
      );
      ;
    } catch (e) {
      if (contexxt.mounted) {
        contexxt.showSnackBar('Error occured !');
        Provider.of<MainProvider>(contexxt, listen: false)
            .updateLoadingSubmitStatus(status: false);
      }
    }
  }
}
