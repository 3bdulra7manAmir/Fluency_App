import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluency/Features/auth/login/data/repository/auth_repository.dart';
import 'package:fluency/Features/auth/login/domain/entites/auth_entity.dart';

final authControllerProvider = ChangeNotifierProvider((ref) => AuthController(ref.read(authRepositoryProvider)),);
final authRepositoryProvider = Provider((ref) => AuthRepository());

class AuthController extends ChangeNotifier
{
  final AuthRepository authRepository;

  AuthController(this.authRepository);

  AuthEntity? authEntity;
  bool isLoading = false;

  Future<void> login(String email, String password) async
  {
    isLoading = true;
    notifyListeners();

    try
    {
      authEntity = await authRepository.login(email, password);
    }

    catch (e)
    {
      debugPrint("Login failed: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}

