import 'package:byrahul/services/auth/auth_service.dart';
import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  onError(DioException error, ErrorInterceptorHandler handler) async {
    // Handle error here
    print('Error: ${error.message} hello rahul');

    String? errorMessage;

    // For example, handle unauthorized access:
    if (error.response != null) {
      switch (error.response?.statusCode) {
        case 400:
          errorMessage = 'Bad Request';
          break;
        case 401:
          errorMessage = 'Unauthorized';
          break;
        case 403:
          errorMessage = 'Forbidden';
          break;
        case 404:
          errorMessage = 'Not Found';
          break;

        case 500:
          errorMessage = 'Internal Server Error';
          break;

        // Add more cases for specific status codes as needed
        default:
          errorMessage = 'Unexpected error occurred';
      }
    } else if (error.type == DioExceptionType.connectionTimeout) {
      errorMessage = 'Connection timeout';
    } else {
      errorMessage = error.message;
    }

    // Return error or handle it differently
    return handler.next(error.copyWith(
        message:
            errorMessage)); // or handler.resolve(response) to resolve the request
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await Controller.getToken();
    options.headers.addAll({
      "Content-Type": "application/json",
    });
    // get token from the storage
    if (token != null && options.method != 'Get') {
      options.headers.addAll({
        "Authorization": "Bearer ${token}",
        'Content-Type': 'multipart/form-data'
      });
    }

    return super.onRequest(options, handler);
  }
}
