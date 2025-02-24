import 'package:fluency/Features/auth/login/presentation/screens/login_view.dart';
import 'package:fluency/Features/home/presentation/screens/bnb_view.dart';
import 'package:fluency/Features/notifications/presentation/screens/no_notifications/no_notifications_view.dart';
import 'package:fluency/Features/notifications/presentation/screens/notifications/notifications_view.dart';
import 'package:fluency/Features/splash/presentation/screens/splash_view.dart';
import 'package:fluency/Features/teachers/presentation/screens/teachers_api_view.dart';
import 'package:fluency/Features/teachers/presentation/screens/teachers_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter
{
  static const kSplashView = '/SplashView';
  static const kLoginView = '/LoginView';
  static const kNotificationsView = '/NotificationsView';
  static const kNoNotificationsView = '/NoNotificationsView';
  static const kTeachersView = '/TeachersView';
  static const kTeachersAPIView = '/TeachersAPIView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        name: kSplashView,
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: kLoginView,
        name: kLoginView,
        builder: (context, state) => const LoginView(),
      ),

      GoRoute(
        path: kNotificationsView,
        name: kNotificationsView,
        builder: (context, state) => const NotificationsView(),
      ),

      GoRoute(
        path: kNoNotificationsView,
        name: kNoNotificationsView,
        builder: (context, state) => const NoNotificationsView(),
      ),

      GoRoute(
        path: kTeachersView,
        name: kTeachersView,
        builder: (context, state) => const TeachersView(),
      ),
      GoRoute(
        path: kTeachersAPIView,
        name: kTeachersAPIView,
        builder: (context, state) => const TeachersAPIView(),
      ),

      // MOVER //
      GoRoute(
        path: '/',
        builder: (context, state) => const TeachersView(),
      ),
      // MOVER //
    ],
  );
}
