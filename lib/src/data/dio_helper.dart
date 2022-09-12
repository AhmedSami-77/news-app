import 'package:dio/dio.dart';

import 'package:newsapp/src/constant/strings.dart';

class DioHelper {
  static Dio? _dio;

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: kBaseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String methodUrl, required Map<String, dynamic> query}) async {
    return await _dio!.get(methodUrl, queryParameters: query);
  }
}
