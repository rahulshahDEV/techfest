import 'package:auto_route/auto_route.dart';
import 'package:byrahul/Extension/extension2.dart';
import 'package:byrahul/Extension/extension3.dart';
import 'package:byrahul/app_router/route_import.dart';
import 'package:byrahul/app_router/route_import.gr.dart';
import 'package:byrahul/constant.dart';
import 'package:byrahul/pages/homescreen.dart';
import 'package:byrahul/pages/wrapper.dart';
import 'package:byrahul/provider/login_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fStorage;
import 'package:provider/provider.dart';

class Controller {
  static final dio = Dio();
  static const storage = fStorage.FlutterSecureStorage();

  static Future<void> storeToken(String token) async {
    try {
      await storage.write(key: 'jwt_token', value: token);
    } on MissingPluginException {
      print('platform error !');
    }
  }

  static Future<void> deleteToken(BuildContext context) async {
    try {
      await storage.delete(key: 'jwt_token').then(
        (value) {
          AutoRouter.of(context).pushNamed('/');
        },
      );
    } catch (e) {
      context.showSnackBar(e.toString());
    }
  }

  static Future<String?> getToken() async {
    String? token = await storage.read(key: 'jwt_token');
    print(token);
    return token;
  }

  static Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    var reqbody = {"email": email, "password": password};
    int? statusCode;
    print(reqbody);
    try {
      var response = await dio.post(
        '$URI/login',
        data: reqbody,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        Provider.of<LoginProvider>(context, listen: false)
            .loadingStatus(status: false);
        final String getToken = response.data['token'];
        print(getToken);
        storeToken(getToken);
        context.router.pushAndPopUntil(
          const WrapperRoute(),
          predicate: (route) => false, // Pop all previous routes
        );
      } else {
        Provider.of<LoginProvider>(context, listen: false)
            .loadingStatus(status: true);
      }
    } catch (e) {
      context.showSnackBar('Something went wrong !');
      Provider.of<LoginProvider>(context, listen: false)
          .loadingStatus(status: false);
    }
  }
}
