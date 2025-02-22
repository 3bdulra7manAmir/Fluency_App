import 'package:fluency/Features/auth/login/presentation/screens/login_view.dart';
import 'package:fluency/Features/home/presentation/screens/bnb_view.dart';
import 'package:fluency/Features/notifications/presentation/screens/no_notifications/no_notifications_view.dart';
import 'package:fluency/Features/notifications/presentation/screens/notifications/notifications_view.dart';
import 'package:fluency/Features/splash/presentation/screens/splash_view.dart';
import 'package:fluency/Features/teachers/presentation/screens/teachers_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter
{
  static const kSplashView = '/SplashView';
  static const kLoginView = '/LoginView';
  static const kNotificationsView = '/NotificationsView';
  static const kNoNotificationsView = '/NoNotificationsView';
  static const kTeachersView = '/TeachersView';

  static final router = GoRouter(
    routes: [
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
        name: kNotificationsView,
        builder: (context, state) => const NoNotificationsView(),
      ),

      GoRoute(
        path: kTeachersView,
        builder: (context, state) => const TeachersView(),
      ),

      // MOVER //
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      // MOVER //
    ],
  );
}
