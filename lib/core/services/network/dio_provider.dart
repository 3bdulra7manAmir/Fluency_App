import 'package:fluency/Core/services/network/dio_init.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final dioProvider = Provider<Dio>((ref) => DioClient.dio);
