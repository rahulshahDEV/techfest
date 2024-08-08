import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/interceptor/interceptor.dart';
import 'package:dio/dio.dart';

// const List<String> status = <String>['Published', 'Draft'];

enum Status { Published, Draft }

var URI = 'http://10.0.2.2:3000/api/v1'.validateApiUri();

final dio = Dio(BaseOptions(
    // baseUrl: '',
    ))..interceptors.add(DioInterceptor());
