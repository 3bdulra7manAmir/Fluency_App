import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluency/Features/auth/login/data/repository/auth_repository.dart';
import 'package:fluency/Features/auth/login/domain/entites/auth_entity.dart';

class AuthController extends ChangeNotifier
{
  AuthController(this._authRepository);

  final AuthRepository _authRepository;
  AuthEntity? _authEntity;
  bool _isLoading = false;
  String? _errorMessage;

  
  AuthEntity? get authEntity => _authEntity;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login(String email, String password) async
  {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try
    {
      _authEntity = await _authRepository.login(email, password);
    }
    catch (e)
    {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}

final authControllerProvider = ChangeNotifierProvider((ref) {
  return AuthController(AuthRepository());
});
