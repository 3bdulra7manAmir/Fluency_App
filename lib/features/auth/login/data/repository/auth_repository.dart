import 'dart:async';
import 'dart:convert';
import 'package:fluency/Features/auth/login/domain/entites/auth_entity.dart';
import 'package:flutter/services.dart';

class AuthRepository
{
  Future<AuthEntity> login(String email, String password) async
  {
    await Future.delayed(const Duration(seconds: 2));

    final String response = await rootBundle.loadString('assets/json/auth_mock.json');
    final data = await json.decode(response);

    return AuthEntity.fromJson(data);
  }
}