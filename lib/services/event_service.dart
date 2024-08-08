import 'package:byrahul/Extension/extension2.dart';
import 'package:byrahul/constant.dart';
import 'package:byrahul/model/event_card.dart';
import 'package:byrahul/provider/main_provider.dart';
import 'package:byrahul/services/blog_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../model/event_model.dart';

class EventService {
  static String? imagePath;

  static Future<List<dynamic>?> getFrontendEvent() async {
    try {
      final res = await dio.get('$URI/frontend/event');
      return res.data;
    } catch (e) {
      print('error from event');
      print(e.toString());
      return null;
    }
  }

  static void Pickimage({required BuildContext context}) async {
    await BlogService.pickIMAGE(context: context);
    imagePath = BlogService.Path;
  }

  static Future<EventCard?> getEventById({required String id}) async {
    EventCard? res;
    try {
      var response = await dio.get('$URI/event/$id');
      res = EventCard.fromJson(response.data);
    } catch (e) {
      print(e.toString());
    }
    return res;
  }

  static Future<EventModel?> getEvents({required int page}) async {
    EventModel? finalRes;
    try {
      var res = await dio.get('$URI/event/?per_page=10&page=$page');
      finalRes = EventModel.fromJson(res.data);

      return finalRes;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<void> updateEvents(
      {required String id,
      required BuildContext context,
      required String link,
      required String title,
      required String imagePath,
      required String description,
      required String status}) async {
    try {
      final FormData formData = FormData.fromMap({
        'title': title,
        'link': link,
        'description': description,
        'status': status,
        'image': imagePath
      });

      await dio.patch('$URI/event/id',
          data: formData,
          options: Options(
            headers: {'Content-Type': 'multipart/form-data'},
          ));
    } catch (e) {
      context.showSnackBar("Something wen't Wrong !");
    }
  }

  static Future<void> addEvent(
      {required String link,
      required String title,
      required String description,
      required BuildContext context,
      required String status}) async {
    final FormData formData = FormData.fromMap({
      'title': title,
      'link': link,
      'description': description,
      'status': status,
      'image': await MultipartFile.fromFile(imagePath!,
          contentType: DioMediaType.parse('image/jpg'))
    });
    print(imagePath);
    if (imagePath != null) {
      try {
        context.read<MainProvider>().updateLoadingEvent(status: true);

        await dio
            .post('$URI/event/create',
                data: formData,
                options: Options(
                  headers: {'Content-Type': 'multipart/form-data'},
                ))
            .then(
              (value) => context
                  .read<MainProvider>()
                  .updateLoadingEvent(status: false),
            );
      } catch (e) {
        print(e.toString());
        context.read<MainProvider>().updateLoadingEvent(status: false);
      }
    }
  }

  static Future<void> deletedEvent(
      {required String id, required BuildContext context}) async {
    try {
      await dio.delete('$URI/event/$id').then(
            (value) => context.showSnackBar('Deleted !'),
          );
    } catch (e) {
      print(e.toString());
    }
  }
}
