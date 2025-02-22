import 'package:dio/dio.dart';


class DioClient
{
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.fluency.live/api/v1/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers:
      {
        'Authorization': 'Bearer 97|gAYT90VDWZQgKUOWQ2MLMkj5Yrf87IE3RGNLmrnC9bf874bd',
        'Content-Type': 'application/json',
      },
    ),
  );

  static Dio get dio => _dio;
}