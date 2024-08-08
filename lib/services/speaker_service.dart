import 'package:byrahul/constant.dart';
import 'package:byrahul/model/speaker.dart';
import 'package:byrahul/services/blog_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SpeakerService {
  // add new speaker

  static String? imagePath;

  static void Pickimage({required BuildContext context}) async {
    await BlogService.pickIMAGE(context: context);
    imagePath = BlogService.Path;
  }

  static Future<void> postData(
      {required String name,
      required String position,
      required String description,
      required String status,
      required String facebook,
      required String twitter,
      required String Linkedin}) async {
    final FormData formData = FormData.fromMap({
      "name": name,
      "position": position,
      "description": description,
      "status": status,
      "facebook": facebook,
      "twitter": twitter,
      "linkedin": Linkedin,
      "image": await MultipartFile.fromFile(imagePath!,
          contentType: DioMediaType.parse('image/jpg'))
    });
    print(imagePath);
    if (imagePath != null) {
      await dio.post('$URI/speaker/create',
          data: formData,
          options: Options(
            headers: {'Content-Type': 'multipart/form-data'},
          ));
    }
  }

  // get speaker list
  static Future<Speaker> getSpeaker({required int page}) async {
    var speakerResponse;
    try {
      var response = await dio.get('$URI/speaker?per_page=10&page=$page');
      speakerResponse = Speaker.fromJson(response.data);
    } catch (e) {
      print(e.toString());
    }
    return speakerResponse;
  }

  // /api/v1/speaker/:id

  // patch  by id
  static Future<void> updatedSpeakerId(
      {required String id,
      required String name,
      required String position,
      required String description,
      required String status,
      required String imagePath,
      required String facebook,
      required String twitter,
      required String Linkedin}) async {
    try {
      final FormData formData = FormData.fromMap({
        "name": name,
        "position": position,
        "description": description,
        "status": status,
        "facebook": facebook,
        "twitter": twitter,
        "linkedin": Linkedin,
        "image": imagePath
      });
      await dio.patch(data: formData, '$URI/speaker/$id');
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<SpeakerElement?> getSpeakerById({required String id}) async {
    SpeakerElement? response;
    try {
      var result = await dio.get('$URI/speaker/$id');
      response = SpeakerElement.fromJson(result.data);
    } catch (e) {
      print(e.toString());
    }
    return response;
  }

  static Future<void> deleteSpeaker({required String id}) async {
    try {
      await dio.delete(
        '$URI/speaker/$id',
        // options: Options(headers: {
        //   'Authorization': 'Bearer $token',
        // }
        // )
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
