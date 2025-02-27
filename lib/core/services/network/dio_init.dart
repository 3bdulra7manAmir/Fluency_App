import 'package:dio/dio.dart';
import 'package:fluency/Core/services/services/api_strings.dart';

class DioClient
{
  DioClient._internal();
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  static Dio get dio => _instance._dio;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiStrings.baseURL,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers:
      {
        'Authorization': ApiStrings.authKey,
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
