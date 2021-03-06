import 'package:dio/dio.dart';
import 'package:factum_mart/shared/network/end_points.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) {
    debugPrint('***** START REQUEST *****');
    debugPrint('URI: ' + baseUrl + url);
    debugPrint('****** END REQUEST ******');
    return dio.post(
      url,
      options: Options(
        headers: {
          'lang': 'en',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token ?? '',
        },
      ),
      data: data,
    );
  }

  static Future<Response> getData({
    required String url,
    String? token,
    Map<String, dynamic>? query,
  }) {
    debugPrint('***** START REQUEST *****');
    debugPrint('URI: ' + baseUrl + url);
    debugPrint('****** END REQUEST ******');

    return dio.get(
      url,
      options: Options(
        headers: {
          'lang': 'en',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token ?? '',
        },
      ),
      queryParameters: query,
    );
  }
}
