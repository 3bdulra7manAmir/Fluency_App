import 'package:fluency/Config/router/app_route_error_widget.dart';
import 'package:fluency/Config/router/app_routes.dart';
import 'package:fluency/Features/auth/login/presentation/screens/login_view.dart';
import 'package:fluency/Features/home/presentation/screens/bnb_view.dart';
import 'package:fluency/Features/notifications/presentation/screens/no_notifications/no_notifications_view.dart';
import 'package:fluency/Features/notifications/presentation/screens/notifications/notifications_view.dart';
import 'package:fluency/Features/splash/presentation/screens/splash_view.dart';
import 'package:fluency/Features/teachers/presentation/screens/teachers_session_view.dart';
import 'package:fluency/Features/teachers/presentation/screens/teachers_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  const AppRouter._();

  static final navigatorState = GlobalKey<NavigatorState>(debugLabel: 'root');

  static final router = GoRouter(
    navigatorKey: navigatorState,
    debugLogDiagnostics: kDebugMode,
    //initialLocation: AppRoutes.kSplashView,
    errorBuilder: (context, state) => const RouterErrorWidget(),
    routes: [
      GoRoute(
        path: AppRoutes.kSplashView,
        name: AppRoutes.kSplashView,
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: AppRoutes.kLoginView,
        name: AppRoutes.kLoginView,
        builder: (context, state) => const LoginView(),
      ),

      GoRoute(
        path: AppRoutes.kNotificationsView,
        name: AppRoutes.kNotificationsView,
        builder: (context, state) => const NotificationsView(),
      ),

      GoRoute(
        path: AppRoutes.kNoNotificationsView,
        name: AppRoutes.kNoNotificationsView,
        builder: (context, state) => const NoNotificationsView(),
      ),

      GoRoute(
        path: AppRoutes.kTeachersView,
        name: AppRoutes.kTeachersView,
        builder: (context, state) => const TeachersView(),
      ),

      GoRoute(
        path: AppRoutes.kTeachersAPIView,
        name: AppRoutes.kTeachersAPIView,
        builder: (context, state) => const TeachersSessionView(),
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
