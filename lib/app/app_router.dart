// ignore_for_file: unused_import

import 'package:fluency/features/login/login_view.dart';
import 'package:fluency/features/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter
{

  static const kSplashView = '/SplashView';
  static const kLoginView = '/LoginView';

  static final router = GoRouter(
    routes:
    [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}