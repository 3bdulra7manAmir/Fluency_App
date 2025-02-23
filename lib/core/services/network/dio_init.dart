import 'package:dio/dio.dart';

class DioClient
{
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.fluency.live/api/v1/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Authorization': 'Bearer 97|gAYT90VDWZQgKUOWQ2MLMkj5Yrf87IE3RGNLmrnC9bf874bd',
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler)
      {
        print("📡 [Request] ${options.method} ${options.uri}");
        return handler.next(options);
      },
      onResponse: (response, handler)
      {
        print("✅ [Response] ${response.statusCode}: ${response.data}");
        return handler.next(response);
      },
      onError: (DioException error, handler)
      {
        print("❌ [Error] ${error.message}");
        return handler.next(error);
      },
    ));

  static Dio get dio => _dio;
}
