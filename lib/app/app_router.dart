// ignore_for_file: unused_import

import 'package:fluency/features/login/presentation/pages/login_view.dart';
import 'package:fluency/features/no_notifications/presentation/pages/no_notifications_view.dart';
import 'package:fluency/features/notifications/presentation/pages/notifications_view.dart';
import 'package:fluency/features/splash/presentation/pages/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter
{

  static const kSplashView = '/SplashView';
  static const kLoginView = '/LoginView';
  static const kNotificationsView = '/NotificationsView';
  static const kNoNotificationsView = '/NoNotificationsView';

  static final router = GoRouter(
    routes:
    [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),

      GoRoute(
        path: kNotificationsView,
        builder: (context, state) => const NotificationsView(),
      ),

      GoRoute(
        path: kNoNotificationsView,
        builder: (context, state) => const NoNotificationsView(),
      ),


      // MOVER //
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      // MOVER //
    ],
  );
}