// ignore_for_file: unused_import

import 'package:fluency/features/splash/splash.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter
{

  static const kSplashView = '/loginView';

  static final router = GoRouter(
    routes:
    [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}