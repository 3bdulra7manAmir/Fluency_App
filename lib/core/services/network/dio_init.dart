import 'package:dio/dio.dart';

class DioClient
{
  DioClient._internal();
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  static Dio get dio => _instance._dio;

  final Dio _dio = Dio(
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
  )..interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler)
      {
        return handler.next(options);
      },
      onResponse: (response, handler)
      {
        return handler.next(response);
      },
      onError: (DioException error, handler)
      {
        return handler.next(error);
      },
    ));
}
